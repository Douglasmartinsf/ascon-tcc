/* Full-rate absorption and chained p[8] vectors using the pinned upstream.
 * These are datapath experiments, not complete AEAD KATs. */
#include <inttypes.h>
#include <stdio.h>
#include <string.h>
#include "permutations.h"
#include "word.h"

static uint64_t random_state = UINT64_C(0x243f6a8885a308d3);

static uint64_t next_random(void) {
  random_state ^= random_state << 13;
  random_state ^= random_state >> 7;
  random_state ^= random_state << 17;
  return random_state;
}

static void emit_state(FILE *file, const ascon_state_t *s) {
  for (int w = 0; w < 5; ++w)
    fprintf(file, "%016" PRIx64 "%c", s->x[w], w == 4 ? '\n' : ' ');
}

int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *file = fopen(argv[1], "w");
  if (!file) return 2;
  const uint8_t constants[8] = {0xb4, 0xa5, 0x96, 0x87, 0x78, 0x69, 0x5a, 0x4b};
  /* Zero, ones, byte ramp, 320 state bits, 128 data bits, 64 random states.
   * Each sequence absorbs and permutes three complete blocks (48 bytes). */
  fprintf(file, "515 3\n");
  for (int sample = 0; sample < 515; ++sample) {
    ascon_state_t state = {{0}};
    for (int w = 0; w < 5; ++w) {
      if (sample == 1) state.x[w] = UINT64_MAX;
      if (sample == 2 || (sample >= 323 && sample < 451))
        for (int b = 0; b < 8; ++b)
          state.x[w] |= (uint64_t)(8 * w + b) << (8 * b);
      if (sample >= 451) state.x[w] = next_random();
    }
    if (sample >= 3 && sample < 323)
      state.x[(sample - 3) / 64] = UINT64_C(1) << ((sample - 3) % 64);
    emit_state(file, &state);
    for (int block = 0; block < 3; ++block) {
      uint8_t data[16] = {0};
      if (sample == 1) memset(data, 0xff, sizeof(data));
      if (sample == 2)
        for (int b = 0; b < 16; ++b) data[b] = (uint8_t)(16 * block + b);
      if (sample >= 323 && sample < 451)
        data[(sample - 323) / 8] = (uint8_t)(1u << ((sample - 323) % 8));
      if (sample >= 451)
        for (int b = 0; b < 16; ++b) data[b] = (uint8_t)next_random();
      fprintf(file, "%016" PRIx64 "%016" PRIx64 "\n",
              LOADBYTES(data + 8, 8), LOADBYTES(data, 8));
      state.x[0] ^= LOADBYTES(data, 8);
      state.x[1] ^= LOADBYTES(data + 8, 8);
      emit_state(file, &state);
      ascon_state_t expected = state;
      P8(&expected);
      for (int r = 0; r < 8; ++r) {
        ROUND(&state, constants[r]);
        emit_state(file, &state);
      }
      for (int w = 0; w < 5; ++w)
        if (state.x[w] != expected.x[w]) return 3;
    }
  }
  int failed = ferror(file);
  if (fclose(file) != 0 || failed) return 4;
  puts("[DATAPATH_REFERENCE] PASS: 515 sequences, 1545 blocks, 12360 rounds");
  return 0;
}
