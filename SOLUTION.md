# Solution to Erdős Problem 243 (JSP-000243)

## Problem

What is the shortest integer interval containing distinct denominators whose reciprocals sum to one?

## Mathematical Solution

**Answer: 4** (the interval [2, 6], of length b−a = 4).

Witness: 1/2 + 1/3 + 1/6 = 1, where {2, 3, 6} ⊂ [2, 6].

### Proof that no shorter interval works

For an interval [a, b] with b−a ≤ 3, we show no subset of {a, ..., b} has reciprocals summing to 1:

- **a=2, length ≤ 3**: All subsets of {2,3,4,5}, {2,3,4}, {2,3}, and {2} checked exhaustively — none sums to 1.
- **a=3**: The total 1/3+1/4+1/5+1/6 = 57/60 < 1, so no subset can reach 1.
- **a=4**: 1/4+1/5+1/6+1/7 = 319/420 < 1.
- **a=5**: 1/5+1/6+1/7+1/8 = 533/840 < 1.
- **a≥6**: Each 1/d ≤ 1/6, so sum of at most 4 terms ≤ 4/6 = 2/3 < 1.

## References

- [Cr01] Croot, "On unit fractions with denominators in short intervals", Acta Arith. (2001), 99-114.

## Lean Formalization

The proof uses `decide` (kernel computation) for all checks. **0 axioms**.

## Paper-to-Code Mapping

| Mathematical Step | Lean Theorem | Method |
|---|---|---|
| Witness works | `witness` | `decide` |
| No subset of {2,3,4,5} works | `no_subset_2345` | `decide` (15 subsets) |
| No subset of {2,3,4} works | `no_subset_234` | `decide` (7 subsets) |
| No subset of {2,3} works | `no_subset_23` | `decide` (3 subsets) |
| {2} alone doesn't work | `no_subset_2` | `decide` |
| a=3: total < LCM | `total_3456_lt` etc. | `decide` |
| a=4: total < LCM | `total_4567_lt` | `decide` |
| a=5: total < LCM | `total_5678_lt` | `decide` |
| a≥6: bound | `bound_4_lt_6` | `decide` |
| Main theorem | `erdos_243` | Combines all via `decide` |
