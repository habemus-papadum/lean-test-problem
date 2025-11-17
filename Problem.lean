/-
Natural language statement:

Let p be a prime number. Then for every nonzero residue class a modulo p,
there exists a unique residue class b modulo p such that a * b ≡ 1 (mod p).
Equivalently: in ℤ/pℤ, every nonzero element has a unique multiplicative inverse.
-/

import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Nat.Prime.Basic

set_option autoImplicit false

open scoped Nat

theorem inverse_exists_unique_mod_prime
    (p : ℕ)
    (hp : Nat.Prime p) :
    ∀ (a : ZMod p), a ≠ 0 → ∃! (b : ZMod p), a * b = 1 := by
  sorry
