import Game.Metadata
import Game.Levels.SetTheory.L10_Morgan

World "SetTheory"
Level 11

Title "Strikte Teilmenge"

Introduction
"
Strikte Teilmengen sind in Lean eher selten, aber wir schauen sie hier
trotzdem kurz an : `A ⊂ B` (`\\ssub`) bedeutet `(A ⊆ B) ∧ (¬B ⊆ A)`.
Entsprechend, kann man die gleichen Methoden wie beim UND benützen
(`rcases`/`constructor`).

Zudem kann man mit `rw [ssubset_def]` explizit die Definition einsetzen.

Note: `rw [subset_def]` macht das gleiche für `⊆`.
"

open Set

/--  -/
Statement (A B : Set ℕ) (h : A ⊂ B) : ∃ x, x ∈ B \ A := by
  rcases h with ⟨h₁, h₂⟩
  rw [subset_def] at h₂
  rw [not_forall] at h₂
  rcases h₂ with ⟨x, hx⟩
  use x
  rw [not_imp] at hx
  rw [mem_diff]
  assumption

NewTheorem Set.subset_def Set.ssubset_def not_imp Set.mem_diff
TheoremTab "Set"
