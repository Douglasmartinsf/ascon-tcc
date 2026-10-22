/* Permutation vectors from the pinned upstream ROUND/P8/P12 functions. */
#include <inttypes.h>
#include <stdio.h>
#include "permutations.h"
#include "word.h"

static uint64_t random_state = UINT64_C(0x243f6a8885a308d3);

static void emit_state(FILE *file, const ascon_state_t *s) {
  for (int w = 0; w < 5; ++w)
    fprintf(file, "%016" PRIx64 "%c", s->x[w], w == 4 ? '\n' : ' ');
}

static uint64_t next_random(void) {
  random_state ^= random_state << 13;
  random_state ^= random_state >> 7;
  random_state ^= random_state << 17;
  return random_state;
}

int main(int argc, char **argv) {
  if (argc != 2) return 2;
  FILE *permutations = fopen(argv[1], "w");
  if (!permutations) return 2;
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
  if (ferror(permutations) || fclose(permutations) != 0) return 4;
  puts("[PERMUTATION_REFERENCE] PASS: 5424 permutations");
  return 0;
}
