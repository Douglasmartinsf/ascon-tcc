/* Capture initialization and three full AD blocks from unmodified aead.c.
 * Padding and subsequent phases execute only in C, outside this RTL corpus. */
#include <inttypes.h>
#include <stdio.h>
#include <string.h>
#include "crypto_aead.h"
#include "permutations.h"
#include "word.h"

static ascon_state_t initialized, blocks[3][9];
static int init_count, block_count, round_count, collecting;
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
  } else if (!strcmp(text, "absorb adata")) {
    if (block_count >= 3 || collecting) { collecting = -1; return; }
    blocks[block_count++][0] = *s;
    round_count = 0;
    collecting = 1;
  } else if (collecting == 1) {
    blocks[block_count - 1][++round_count] = *s;
    if (round_count == 8) collecting = 0;
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
  fprintf(f, "323 3\n");
  for (int sample = 0; sample < 323; ++sample) {
    uint8_t input[32] = {0}, ad[48] = {0}, empty[1] = {0}, output[16];
    if (sample == 1) {
      memset(input, 0xff, sizeof(input));
      memset(ad, 0xff, sizeof(ad));
    }
    if (sample == 2) {
      for (int b = 0; b < 32; ++b) input[b] = (uint8_t)b;
      for (int b = 0; b < 48; ++b) ad[b] = (uint8_t)b;
    }
    if (sample >= 3 && sample < 259) {
      input[(sample - 3) / 8] = (uint8_t)(1u << ((sample - 3) % 8));
      for (int b = 0; b < 48; ++b) ad[b] = (uint8_t)(sample + b);
    }
    if (sample >= 259) {
      for (int b = 0; b < 32; ++b) input[b] = (uint8_t)next_random();
      for (int b = 0; b < 48; ++b) ad[b] = (uint8_t)next_random();
    }
    init_count = block_count = round_count = collecting = 0;
    unsigned long long length = 0;
    if (crypto_aead_encrypt(output, &length, empty, 0, ad, sizeof(ad),
                            NULL, input + 16, input) != 0 || length != 16 ||
        init_count != 1 || block_count != 3 || round_count != 8 || collecting)
      return 3;
    fprintf(f, "%016" PRIx64 "%016" PRIx64 " ",
            LOADBYTES(input + 8, 8), LOADBYTES(input, 8));
    fprintf(f, "%016" PRIx64 "%016" PRIx64 "\n",
            LOADBYTES(input + 24, 8), LOADBYTES(input + 16, 8));
    emit_state(f, &initialized);
    for (int block = 0; block < 3; ++block) {
      fprintf(f, "%016" PRIx64 "%016" PRIx64 "\n",
              LOADBYTES(ad + 16 * block + 8, 8), LOADBYTES(ad + 16 * block, 8));
      for (int r = 0; r < 9; ++r) emit_state(f, &blocks[block][r]);
    }
  }
  int failed = ferror(f);
  if (fclose(f) != 0 || failed) return 4;
  puts("[CONTROLLER_REFERENCE] PASS: 323 initializations, 969 blocks, 7752 rounds");
  return 0;
}
