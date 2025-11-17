/-
Natural language statement:

Let p be a prime number. Then for every nonzero residue class a modulo p,
there exists a unique residue class b modulo p such that a * b ≡ 1 (mod p).
Equivalently: in ℤ/pℤ, every nonzero element has a unique multiplicative inverse.
-/

import Mathlib

set_option autoImplicit false

open scoped Nat

/--
For a prime modulus `p`, every nonzero residue class in `ZMod p`
has a unique multiplicative inverse.
-/
theorem inverse_exists_unique_mod_prime
    (p : ℕ)
    (hp : Nat.Prime p) :
    ∀ (a : ZMod p), a ≠ 0 → ∃! (b : ZMod p), a * b = 1 := by
  classical
  -- Promote the primality assumption to a typeclass instance for `ZMod p`.
  haveI : Fact p.Prime := ⟨hp⟩
  intro a ha
  -- Record the standard inverse identities for later rewrites.
  have hmul : a * a⁻¹ = (1 : ZMod p) := by
    simpa using (mul_inv_cancel₀ (a := a) ha)
  have hmul' : a⁻¹ * a = (1 : ZMod p) := by
    simpa using (inv_mul_cancel₀ (a := a) ha)
  refine ⟨a⁻¹, ?_, ?_⟩
  · -- `a⁻¹` satisfies the inverse equation because `a` is nonzero.
    simp [hmul]
  · -- Uniqueness: any `b` with `a * b = 1` must coincide with `a⁻¹`.
    intro b hb
    have h := congrArg (fun x => a⁻¹ * x) hb
    have h' : (a⁻¹ * a) * b = a⁻¹ := by
      simpa [mul_assoc] using h
    have h'' : b = a⁻¹ := by
      simpa [hmul'] using h'
    exact h''
