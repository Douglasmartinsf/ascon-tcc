/* Capture complete AD and PT traces from the pinned, unmodified aead.c.
 * Finalization runs only in C; its states and tag are not sent to the RTL. */
#include <inttypes.h>
#include <stdio.h>
#include <string.h>
#include "crypto_aead.h"
#include "permutations.h"
#include "word.h"

static ascon_state_t initialized, ad_ops[17][9], pt_ops[16][9], separated, tail;
static int init_count, ad_count, pt_count, domain_count, tail_count;
static int collecting, round_count, failed;
static uint64_t random_state = UINT64_C(0x243f6a8885a308d3);

void print(const char *text) { (void)text; }
void printbytes(const char *text, const uint8_t *b, uint64_t len) {
  (void)text; (void)b; (void)len;
}
void printword(const char *text, uint64_t word) { (void)text; (void)word; }
void printstate(const char *text, const ascon_state_t *s) {
  if (!strcmp(text, "init 2nd key xor")) { initialized = *s; ++init_count; }
  else if (!strcmp(text, "absorb adata") || !strcmp(text, "pad adata")) {
    if (collecting || ad_count >= 17) { failed = 1; return; }
    ad_ops[ad_count++][0] = *s;
    collecting = 1;
    round_count = 0;
  } else if (!strcmp(text, "absorb plaintext")) {
    if (collecting || pt_count >= 16) { failed = 1; return; }
    pt_ops[pt_count++][0] = *s;
    collecting = 2;
    round_count = 0;
  } else if (collecting && !strcmp(text, " round output")) {
    ++round_count;
    if (collecting == 1) ad_ops[ad_count - 1][round_count] = *s;
    else pt_ops[pt_count - 1][round_count] = *s;
    if (round_count == 8) collecting = 0;
  } else if (!strcmp(text, "domain separation")) { separated = *s; ++domain_count; }
  else if (!strcmp(text, "pad plaintext")) { tail = *s; ++tail_count; }
}

static uint64_t next_random(void) {
  random_state ^= random_state << 13;
  random_state ^= random_state >> 7;
  random_state ^= random_state << 17;
  return random_state;
}

static void emit_state(FILE *f, const ascon_state_t *s) {
  for (int w = 0; w < 5; ++w)
    fprintf(f, "%016" PRIx64 "%c", s->x[w], w == 4 ? '\n' : ' ');
}

static void emit_bus(FILE *f, const uint8_t *bytes, int offset, int count) {
  uint8_t bus[16];
  for (int b = 0; b < 16; ++b)
    bus[b] = b < count ? bytes[offset + b] : (uint8_t)(0xa5 ^ b);
  fprintf(f, "%016" PRIx64 "%016" PRIx64 "\n", LOADBYTES(bus + 8, 8), LOADBYTES(bus, 8));
}

int main(int argc, char **argv) {
  if (argc != 3) return 2;
  FILE *f = fopen(argv[1], "w"), *cipher = fopen(argv[2], "w");
  if (!f || !cipher) return 2;
  const int boundaries[] = {0, 1, 7, 8, 9, 15, 16, 17, 31, 32, 33, 48, 49, 64, 80};
  int total_ad = 0, total_pt = 0, total_rounds = 0, total_cipher = 0;
  fprintf(f, "1558\n");
  for (int sample = 0; sample < 1558; ++sample) {
    int plen, alen, pattern;
    if (sample < 1089) {
      plen = sample / 33; alen = sample % 33; pattern = 5;
    } else if (sample < 1494) {
      plen = (sample - 1089) % 81;
      pattern = (sample - 1089) / 81;
      alen = boundaries[(plen + 3 * pattern) % 15];
    } else {
      plen = 81 + (int)(next_random() % 176);
      alen = (int)(next_random() % 257);
      pattern = 4;
    }
    uint8_t input[32], ad[256], pt[256], output[272];
    for (int b = 0; b < 32; ++b)
      input[b] = pattern == 0 ? 0 : pattern == 1 ? 0xff :
                 pattern == 2 || pattern == 5 ? (uint8_t)b :
                 pattern == 3 ? (uint8_t)(0x80 ^ b) : (uint8_t)next_random();
    for (int b = 0; b < alen; ++b)
      ad[b] = pattern == 0 ? 0 : pattern == 1 ? 0xff : pattern == 2 ? (uint8_t)b :
              pattern == 3 ? (b % 2 ? 0x80 : 1) : pattern == 5 ? (uint8_t)(0x30 + b) :
              (uint8_t)next_random();
    for (int b = 0; b < plen; ++b)
      pt[b] = pattern == 0 ? 0 : pattern == 1 ? 0xff : pattern == 2 ? (uint8_t)b :
              pattern == 3 ? (b % 2 ? 0x80 : 1) : pattern == 5 ? (uint8_t)(0x20 + b) :
              (uint8_t)next_random();
    init_count = ad_count = pt_count = domain_count = tail_count = 0;
    collecting = round_count = failed = 0;
    unsigned long long length = 0;
    if (crypto_aead_encrypt(output, &length, pt, plen, ad, alen, NULL,
                            input + 16, input) != 0 || length != (unsigned)(plen + 16) ||
        init_count != 1 || domain_count != 1 || tail_count != 1 || collecting || failed ||
        ad_count != (alen ? alen / 16 + 1 : 0) || pt_count != plen / 16) return 3;
    int ad_transfers = alen ? (alen + 15) / 16 : 1;
    int pt_transfers = plen ? (plen + 15) / 16 : 1;
    fprintf(f, "%d %d %d %d %d\n", sample, alen, plen, ad_transfers, pt_transfers);
    fprintf(f, "%016" PRIx64 "%016" PRIx64 " %016" PRIx64 "%016" PRIx64 "\n",
            LOADBYTES(input + 8, 8), LOADBYTES(input, 8),
            LOADBYTES(input + 24, 8), LOADBYTES(input + 16, 8));
    emit_state(f, &initialized);
    int operation = 0;
    for (int transfer = 0; transfer < ad_transfers; ++transfer) {
      int bytes = alen - 16 * transfer;
      if (bytes > 16) bytes = 16;
      int last = transfer == ad_transfers - 1;
      fprintf(f, "%d %d ", bytes, last);
      emit_bus(f, ad, 16 * transfer, bytes);
      int count = !alen ? 0 : last && bytes == 16 ? 2 : 1;
      for (int op = 0; op < count; ++op, ++operation)
        for (int r = 0; r < 9; ++r) emit_state(f, &ad_ops[operation][r]);
    }
    if (operation != ad_count) return 4;
    emit_state(f, &separated);
    operation = 0;
    for (int transfer = 0; transfer < pt_transfers; ++transfer) {
      int bytes = plen - 16 * transfer;
      if (bytes > 16) bytes = 16;
      int last = transfer == pt_transfers - 1;
      fprintf(f, "%d %d ", bytes, last);
      emit_bus(f, pt, 16 * transfer, bytes);
      uint8_t bus[16] = {0};
      if (bytes) memcpy(bus, output + 16 * transfer, bytes);
      fprintf(f, "%016" PRIx64 "%016" PRIx64 "\n", LOADBYTES(bus + 8, 8), LOADBYTES(bus, 8));
      if (bytes == 16) {
        for (int r = 0; r < 9; ++r) emit_state(f, &pt_ops[operation][r]);
        ++operation;
      }
      if (last) emit_state(f, &tail);
      if (bytes) ++total_cipher;
    }
    if (operation != pt_count) return 4;
    fprintf(cipher, "%d %d ", sample, plen);
    for (int b = 0; b < plen; ++b) fprintf(cipher, "%02x", output[b]);
    fputc('\n', cipher);
    total_ad += ad_transfers;
    total_pt += pt_transfers;
    total_rounds += 8 * (ad_count + pt_count);
  }
  int io_failed = ferror(f) || ferror(cipher);
  if (fclose(f) != 0 || fclose(cipher) != 0 || io_failed) return 5;
  printf("[PT_REFERENCE] CASES: 1558\n[PT_REFERENCE] AD_TRANSFERS: %d\n"
         "[PT_REFERENCE] PT_TRANSFERS: %d\n[PT_REFERENCE] CIPHER_BLOCKS: %d\n"
         "[PT_REFERENCE] ROUND_CHECKS: %d\n[PT_REFERENCE] PASS\n",
         total_ad, total_pt, total_cipher, total_rounds);
  return 0;
}
