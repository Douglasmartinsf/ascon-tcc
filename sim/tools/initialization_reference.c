/* Initialization states captured from the pinned, unmodified aead.c trace. */
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
  if (argc != 2) return 2;
  initialization_file = fopen(argv[1], "w");
  if (!initialization_file) return 2;
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
  if (ferror(initialization_file) || fclose(initialization_file) != 0) return 6;
  puts("[INITIALIZATION_REFERENCE] PASS: 323 initializations");
  return 0;
}
