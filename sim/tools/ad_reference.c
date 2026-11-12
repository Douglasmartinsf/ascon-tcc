/* Associated-data states captured from the pinned, unmodified aead.c trace. */
#include <inttypes.h>
#include <stdio.h>
#include <string.h>
#include "crypto_aead.h"
#include "permutations.h"
#include "word.h"

static ascon_state_t initialized, operations[17][9], separated;
static int init_count, operation_count, round_count, collecting, domain_count, failed;
static uint64_t random_state = UINT64_C(0x243f6a8885a308d3);

void print(const char *text) { (void)text; }
void printbytes(const char *text, const uint8_t *b, uint64_t len) {
  (void)text; (void)b; (void)len;
}
void printword(const char *text, uint64_t word) { (void)text; (void)word; }
void printstate(const char *text, const ascon_state_t *s) {
  if (!strcmp(text, "init 2nd key xor")) {
    initialized = *s;
    ++init_count;
  } else if (!strcmp(text, "absorb adata") || !strcmp(text, "pad adata")) {
    if (operation_count >= 17 || collecting) { failed = 1; return; }
    operations[operation_count++][0] = *s;
    round_count = 0;
    collecting = 1;
  } else if (collecting && !strcmp(text, " round output")) {
    operations[operation_count - 1][++round_count] = *s;
    if (round_count == 8) collecting = 0;
  } else if (!strcmp(text, "domain separation")) {
    separated = *s;
    ++domain_count;
  }
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

int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *f = fopen(argv[1], "w");
  if (!f) return 2;
  int total_transfers = 0, total_operations = 0;
  fprintf(f, "469\n");
  for (int sample = 0; sample < 469; ++sample) {
    int length = sample < 405 ? sample % 81 : 81 + (int)(next_random() % 176);
    int pattern = sample < 405 ? sample / 81 : 4;
    uint8_t input[32] = {0}, ad[256] = {0}, empty[1] = {0}, output[16];
    for (int b = 0; b < 32; ++b)
      input[b] = pattern == 0 ? 0 : pattern == 1 ? 0xff :
                 pattern == 2 ? (uint8_t)b : pattern == 3 ? (uint8_t)(0x80 ^ b) :
                 (uint8_t)next_random();
    for (int b = 0; b < length; ++b)
      ad[b] = pattern == 0 ? 0 : pattern == 1 ? 0xff :
              pattern == 2 ? (uint8_t)b : pattern == 3 ? (b % 2 ? 0x80 : 0x01) :
              (uint8_t)next_random();
    init_count = operation_count = round_count = collecting = domain_count = failed = 0;
    unsigned long long output_length = 0;
    if (crypto_aead_encrypt(output, &output_length, empty, 0, ad, length,
                            NULL, input + 16, input) != 0 || output_length != 16 ||
        init_count != 1 || domain_count != 1 || collecting || failed ||
        operation_count != (length ? length / 16 + 1 : 0)) return 3;
    int transfers = length ? (length + 15) / 16 : 1;
    fprintf(f, "%d %d %d %d\n", sample, length, transfers, operation_count);
    fprintf(f, "%016" PRIx64 "%016" PRIx64 " ",
            LOADBYTES(input + 8, 8), LOADBYTES(input, 8));
    fprintf(f, "%016" PRIx64 "%016" PRIx64 "\n",
            LOADBYTES(input + 24, 8), LOADBYTES(input + 16, 8));
    emit_state(f, &initialized);
    int operation = 0;
    for (int transfer = 0; transfer < transfers; ++transfer) {
      int bytes = length - 16 * transfer;
      if (bytes > 16) bytes = 16;
      int last = transfer == transfers - 1;
      uint8_t bus[16];
      for (int b = 0; b < 16; ++b)
        bus[b] = b < bytes ? ad[16 * transfer + b] : (uint8_t)(0xa5 ^ b);
      fprintf(f, "%d %d %016" PRIx64 "%016" PRIx64 "\n", bytes, last,
              LOADBYTES(bus + 8, 8), LOADBYTES(bus, 8));
      int count = !length ? 0 : last && bytes == 16 ? 2 : 1;
      for (int op = 0; op < count; ++op, ++operation)
        for (int r = 0; r < 9; ++r) emit_state(f, &operations[operation][r]);
    }
    if (operation != operation_count) return 4;
    emit_state(f, &separated);
    total_transfers += transfers;
    total_operations += operation_count;
  }
  int io_failed = ferror(f);
  if (fclose(f) != 0 || io_failed) return 5;
  printf("[AD_REFERENCE] CASES: 469\n[AD_REFERENCE] TRANSFERS: %d\n"
         "[AD_REFERENCE] PERMUTATIONS: %d\n[AD_REFERENCE] ROUND_CHECKS: %d\n"
         "[AD_REFERENCE] PASS\n", total_transfers, total_operations, 8 * total_operations);
  return 0;
}
