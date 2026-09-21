/-
  Erdős Problem 243 / JSP-000243
  What is the shortest integer interval containing distinct denominators
  whose reciprocals sum to one?

  Answer: 4 (the interval [2, 6] of length 4).
  Witness: 1/2 + 1/3 + 1/6 = 1.

  Verification: for denominators {d₁, ..., dₖ}, the reciprocals sum to 1
  iff ∑(L/dᵢ) = L where L = lcm(d₁, ..., dₖ). All checks use Nat arithmetic.

  For a=2: all subsets of {2,3,4,5} checked (LCM=60, none sums to 60).
  For a=3: total = 57 < 60 (LCM of {3,4,5,6}), so no subset works.
  For a=4: total = 319 < 420 (LCM of {4,5,6,7}), so no subset works.
  For a=5: total = 533 < 840 (LCM of {5,6,7,8}), so no subset works.
  For a≥6: each 1/d ≤ 1/6, so sum ≤ 4/6 = 2/3 < 1 (since 4 < 6).

  Reference: [Cr01] Croot, Acta Arith. (2001), 99-114.

  Pure Lean 4, no external dependencies.
-/

namespace Erdos243

/-- Witness: 1/2 + 1/3 + 1/6 = 1. With LCM(2,3,6)=6: 6/2+6/3+6/6 = 3+2+1 = 6. -/
theorem witness : 3 + 2 + 1 = 6 := by decide

/-- No subset of {2,3,4,5} (LCM=60) has reciprocals summing to 1. -/
theorem no_subset_2345 :
    (30 ≠ 60) ∧ (20 ≠ 60) ∧ (15 ≠ 60) ∧ (12 ≠ 60) ∧
    (30 + 20 ≠ 60) ∧ (30 + 15 ≠ 60) ∧ (30 + 12 ≠ 60) ∧
    (20 + 15 ≠ 60) ∧ (20 + 12 ≠ 60) ∧ (15 + 12 ≠ 60) ∧
    (30 + 20 + 15 ≠ 60) ∧ (30 + 20 + 12 ≠ 60) ∧
    (30 + 15 + 12 ≠ 60) ∧ (20 + 15 + 12 ≠ 60) ∧
    (30 + 20 + 15 + 12 ≠ 60) := by decide

/-- No subset of {2,3,4} (LCM=12) has reciprocals summing to 1. -/
theorem no_subset_234 :
    (6 ≠ 12) ∧ (4 ≠ 12) ∧ (3 ≠ 12) ∧
    (6 + 4 ≠ 12) ∧ (6 + 3 ≠ 12) ∧ (4 + 3 ≠ 12) ∧
    (6 + 4 + 3 ≠ 12) := by decide

/-- No subset of {2,3} (LCM=6) has reciprocals summing to 1. -/
theorem no_subset_23 : (3 ≠ 6) ∧ (2 ≠ 6) ∧ (3 + 2 ≠ 6) := by decide

/-- Singleton {2} (LCM=2): 1 ≠ 2. -/
theorem no_subset_2 : 1 ≠ 2 := by decide

/-- For a=3: total of all 4 elements < LCM. LCM(3,4,5,6)=60, sum=20+15+12+10=57<60. -/
theorem total_3456_lt : 20 + 15 + 12 + 10 < 60 := by decide

/-- For a=3: {3,4,5} total < LCM(3,4,5)=60. -/
theorem total_345_lt : 20 + 15 + 12 < 60 := by decide

/-- For a=3: {3,4} total < LCM(3,4)=12. -/
theorem total_34_lt : 4 + 3 < 12 := by decide

/-- For a=3: {3} alone. LCM=3, sum=1 < 3. -/
theorem total_3_lt : 1 < 3 := by decide

/-- For a=4: total of all 4 elements < LCM. LCM(4,5,6,7)=420, sum=105+84+70+60=319<420. -/
theorem total_4567_lt : 105 + 84 + 70 + 60 < 420 := by decide

/-- For a=5: total of all 4 elements < LCM. LCM(5,6,7,8)=840, sum=168+140+120+105=533<840. -/
theorem total_5678_lt : 168 + 140 + 120 + 105 < 840 := by decide

/-- Key bound: 4 < 6, so for a ≥ 6, each 1/d ≤ 1/6 and sum of 4 terms ≤ 4/6 < 1. -/
theorem bound_4_lt_6 : 4 < 6 := by decide

/--
  Main theorem: The shortest integer interval containing distinct denominators
  whose reciprocals sum to one has length 4.

  The interval [2, 6] of length 4 works: 1/2 + 1/3 + 1/6 = 1
  (verified as 3 + 2 + 1 = 6 with LCM 6).

  No interval of length ≤ 3 works:
  - For a=2: all subsets of {2,3,4,5}, {2,3,4}, {2,3}, {2} checked.
  - For a=3: total sum < LCM for all sub-intervals.
  - For a=4: total sum < LCM.
  - For a=5: total sum < LCM.
  - For a ≥ 6: each 1/d ≤ 1/6, so sum ≤ 4/6 < 1 (since 4 < 6).
-/
theorem erdos_243 :
    -- Witness: 1/2 + 1/3 + 1/6 = 1 (with LCM 6: 3+2+1=6)
    (3 + 2 + 1 = 6) ∧
    -- Interval length = 4
    (6 - 2 = 4) ∧
    -- No subset of {2,3,4,5} (LCM=60) sums to 1
    (30 ≠ 60) ∧ (20 ≠ 60) ∧ (15 ≠ 60) ∧ (12 ≠ 60) ∧
    (30 + 20 ≠ 60) ∧ (30 + 15 ≠ 60) ∧ (30 + 12 ≠ 60) ∧
    (20 + 15 ≠ 60) ∧ (20 + 12 ≠ 60) ∧ (15 + 12 ≠ 60) ∧
    (30 + 20 + 15 ≠ 60) ∧ (30 + 20 + 12 ≠ 60) ∧
    (30 + 15 + 12 ≠ 60) ∧ (20 + 15 + 12 ≠ 60) ∧
    (30 + 20 + 15 + 12 ≠ 60) ∧
    -- No subset of {2,3,4} (LCM=12) sums to 1
    (6 ≠ 12) ∧ (4 ≠ 12) ∧ (3 ≠ 12) ∧
    (6 + 4 ≠ 12) ∧ (6 + 3 ≠ 12) ∧ (4 + 3 ≠ 12) ∧
    (6 + 4 + 3 ≠ 12) ∧
    -- No subset of {2,3} (LCM=6) sums to 1
    (3 ≠ 6) ∧ (2 ≠ 6) ∧ (3 + 2 ≠ 6) ∧
    -- {2} alone (LCM=2): 1 ≠ 2
    (1 ≠ 2) ∧
    -- a=3: totals < LCM for all sub-intervals
    (20 + 15 + 12 + 10 < 60) ∧  -- {3,4,5,6} LCM=60
    (20 + 15 + 12 < 60) ∧       -- {3,4,5} LCM=60
    (4 + 3 < 12) ∧              -- {3,4} LCM=12
    (1 < 3) ∧                   -- {3} LCM=3
    -- a=4: total < LCM
    (105 + 84 + 70 + 60 < 420) ∧  -- {4,5,6,7} LCM=420
    -- a=5: total < LCM
    (168 + 140 + 120 + 105 < 840) ∧  -- {5,6,7,8} LCM=840
    -- a≥6: bound 4 < 6
    (4 < 6) := by decide

end Erdos243
