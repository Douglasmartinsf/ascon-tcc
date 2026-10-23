/* Test-vector generator for stage 2. Uses the pinned upstream ROUND/P8/P12
 * and captures initialization directly from unmodified aead.c trace hooks. */
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "crypto_aead.h"
#include "permutations.h"
#include "word.h"

static FILE *initialization_file;
static int collecting;
static int captured;
static uint64_t random_state = UINT64_C(0x243f6a8885a308d3);

static void emit_state(FILE *file, const ascon_state_t *s) {
  for (int w = 0; w < 5; ++w)
    fprintf(file, "%016" PRIx64 "%c", s->x[w], w == 4 ? '\n' : ' ');
}

/* Implement upstream's optional trace API without changing the reference. */
void print(const char *text) { (void)text; }
void printbytes(const char *text, const uint8_t *bytes, uint64_t len) {
  (void)text; (void)bytes; (void)len;
}
void printword(const char *text, uint64_t word) { (void)text; (void)word; }
void printstate(const char *text, const ascon_state_t *s) {
  if (!strcmp(text, "init 1st key xor")) collecting = 1;
  if (collecting) {
    emit_state(initialization_file, s);
    ++captured;
  }
  if (!strcmp(text, "init 2nd key xor")) collecting = 0;
}

static uint64_t next_random(void) {
  random_state ^= random_state << 13;
  random_state ^= random_state >> 7;
  random_state ^= random_state << 17;
  return random_state;
}

int main(int argc, char **argv) {
  if (argc != 3) return 2;
  FILE *permutations = fopen(argv[1], "w");
  initialization_file = fopen(argv[2], "w");
  if (!permutations || !initialization_file) return 2;
  /* SP 800-232 Table 5. The upstream only exports P6, P8 and P12. */
  const uint8_t constants[16] = {
    0x3c, 0x2d, 0x1e, 0x0f, 0xf0, 0xe1, 0xd2, 0xc3,
    0xb4, 0xa5, 0x96, 0x87, 0x78, 0x69, 0x5a, 0x4b
  };
  /* For each n: zero, all ones, byte ramp, 320 single-bit states, 16 random. */
  fprintf(permutations, "%d\n", 16 * 339);
  for (int n = 1; n <= 16; ++n) {
    for (int sample = 0; sample < 339; ++sample) {
      ascon_state_t state = {{0}};
      for (int w = 0; w < 5; ++w) {
        if (sample == 1) state.x[w] = UINT64_MAX;
        if (sample == 2)
          for (int b = 0; b < 8; ++b) state.x[w] |= (uint64_t)(w * 8 + b) << (b * 8);
        if (sample >= 323) state.x[w] = next_random();
      }
      if (sample >= 3 && sample < 323)
        state.x[(sample - 3) / 64] = UINT64_C(1) << ((sample - 3) % 64);
      ascon_state_t expected = state;
      if (n == 8) P8(&expected);
      if (n == 12) P12(&expected);
      fprintf(permutations, "%d\n", n);
      emit_state(permutations, &state);
      for (int round = 16 - n; round < 16; ++round) {
        ROUND(&state, constants[round]);
        emit_state(permutations, &state);
      }
      if (n == 8 || n == 12)
        for (int w = 0; w < 5; ++w)
          if (state.x[w] != expected.x[w]) return 3;
    }
  }
  /* Zero, ones, KAT key/nonce, 256 single-bit inputs and 64 random inputs. */
  fprintf(initialization_file, "%d\n", 323);
  for (int sample = 0; sample < 323; ++sample) {
    uint8_t input[32] = {0};
    if (sample == 1) memset(input, 0xff, sizeof(input));
    if (sample == 2) for (int b = 0; b < 32; ++b) input[b] = (uint8_t)b;
    if (sample >= 3 && sample < 259)
      input[(sample - 3) / 8] = (uint8_t)(1u << ((sample - 3) % 8));
    if (sample >= 259)
      for (int b = 0; b < 32; ++b) input[b] = (uint8_t)next_random();
    fprintf(initialization_file, "%016" PRIx64 "%016" PRIx64 " ",
            LOADBYTES(input + 8, 8), LOADBYTES(input, 8));
    fprintf(initialization_file, "%016" PRIx64 "%016" PRIx64 "\n",
            LOADBYTES(input + 24, 8), LOADBYTES(input + 16, 8));
    uint8_t output[16], empty[1] = {0};
    unsigned long long output_length = 0;
    captured = 0;
    if (crypto_aead_encrypt(output, &output_length, empty, 0, empty, 0,
                            NULL, input + 16, input) != 0) return 4;
    if (captured != 14 || output_length != 16 || collecting) return 5;
  }
  if (ferror(permutations) || ferror(initialization_file)) return 6;
  if (fclose(permutations) != 0 || fclose(initialization_file) != 0) return 6;
  puts("[STAGE2_REFERENCE] PASS: 5424 permutations, 323 initializations");
  return 0;
}
