# SKILL: code-review
Trigger: /code-review
Purpose: Review all changes since the last commit before marking any task done.

---

## Step 1 — Read what changed

Run `git diff HEAD` to see all uncommitted changes.
Run `git diff --staged` to see staged changes.
Run `git status` to get the full picture.

List every file that was touched before starting the review.
Read each file fully before making any judgment.

---

## Step 2 — Review each file

For every changed file, check ALL of the following rules.

---

### A) Architecture & Layer Boundaries

- [ ] No layer violations — data never imports presentation, domain never imports data
- [ ] Presentation layer has ZERO business logic — only rendering, interaction, state observation
- [ ] Business logic lives in domain layer only
- [ ] Data access (APIs, DB, storage) lives in data layer only
- [ ] No Flutter imports (`package:flutter/...`) in any file under `domain/` or `logic/`
- [ ] Cubits depend ONLY on use cases — never directly on repositories or datasources
- [ ] No new abstractions or patterns introduced without clear justification

---

### B) State Management

- [ ] Cubit/Bloc used for feature and application state
- [ ] `setState` used ONLY for local UI state (toggles, form focus)
- [ ] `setState` never used for business logic
- [ ] `setState` scoped to the smallest widget possible
- [ ] `BlocBuilder`/`BlocSelector` placed on the smallest widget that needs the state
- [ ] `BlocBuilder`/`BlocSelector` never placed at the top of the tree unnecessarily

---

### C) No Code Generation

- [ ] No `freezed` annotations added
- [ ] No `build_runner` added or referenced
- [ ] Sealed classes used for state unions instead of Freezed
- [ ] Switch expressions used for exhaustive pattern matching

---

### D) Error Handling

- [ ] Errors caught at the data layer boundary — not deep inside business logic
- [ ] Exceptions mapped to typed `Failure` classes in data layer
- [ ] Use cases and repositories return `ApiResult<T>` — never throw across layers
- [ ] Presentation layer maps failures to user-friendly messages and UI states
- [ ] No silent failures — null, empty, loading, and error states handled explicitly

---

### E) Dependency Injection

- [ ] No new packages added without justification
- [ ] Any new package is latest stable, well-maintained, production-grade
- [ ] Dependencies registered in `core/di/` — not instantiated manually
- [ ] Cubits, use cases, and repositories resolved via `get_it`

---

### F) Build Method Discipline

- [ ] `const` constructors used wherever possible
- [ ] No `TextEditingController`, `AnimationController`, `FocusNode` created inside `build()`
- [ ] No heavy work inside `build()` methods
- [ ] Controllers and focus nodes disposed in `StatefulWidget.dispose()`
- [ ] Small, composed widgets preferred to minimize rebuild scope
- [ ] UI files do not exceed 200 lines
- [ ] Sections extracted into dedicated widget classes when file approaches 200 lines
- [ ] Widgets only extracted when actually needed — no premature splitting

---

### G) Shared Code

- [ ] No logic, utility, constant, extension, or helper duplicated across features
- [ ] Reusable code used in 2+ places lives in `core/`
- [ ] `core/` checked before creating any new shared code

---

### H) Security

- [ ] No hardcoded secrets, tokens, or credentials
- [ ] No sensitive information logged
- [ ] External and API input validated
- [ ] No security risks introduced (flag any spotted)

---

### I) Change Discipline

- [ ] Smallest change that solves the problem — no over-engineering
- [ ] Root cause fixed — not the symptom
- [ ] No unrelated code refactored
- [ ] No existing functionality, APIs, flows, or UX broken
- [ ] Relevant code was read before modifying

---

### J) Testing

- [ ] Domain and data layer logic has test coverage
- [ ] Bug fixes include a reproducing test
- [ ] Tests are deterministic — no flaky or timing-dependent logic
- [ ] One behavior per test case

---

### K) Feature Folder Structure

- [ ] New files placed in the correct layer folder:
  - `features/{feature_name}/data/`
  - `features/{feature_name}/domain/`
  - `features/{feature_name}/presentation/`
- [ ] Shared code placed in `core/` not duplicated in feature folders

---

## Step 3 — Output format

For every file reviewed output exactly this:

```
──────────────────────────────────────────
📄 {filename}
──────────────────────────────────────────
Status: ✅ Clean | ⚠️ Warnings | ❌ Violations

Issues:
  ⚠️ [WARNING] {description} — line {N}
  ❌ [VIOLATION] {description} — line {N}

Suggestions:
  → {concrete fix for each issue}
──────────────────────────────────────────
```

If a file has no issues, output:
```
📄 {filename} ✅ Clean — no issues found
```

---

## Step 4 — Summary

After reviewing all files output a summary:

```
══════════════════════════════════════════
  CODE REVIEW SUMMARY
══════════════════════════════════════════
  Files reviewed:    {N}
  Clean:             {N} ✅
  Warnings:          {N} ⚠️
  Violations:        {N} ❌
══════════════════════════════════════════
  Violations found:
  - {filename}: {short description}
  - {filename}: {short description}

  Warnings found:
  - {filename}: {short description}
══════════════════════════════════════════
```

---

## Step 5 — Final verdict

Output ONE of these three verdicts and nothing else after it:

```
✅ APPROVED
   No violations found. Ready to run /commit.
```

```
⚠️ APPROVED WITH WARNINGS
   Minor issues noted above. Can proceed with /commit
   but consider addressing warnings soon.
```

```
❌ BLOCKED
   Violations must be fixed before running /commit.
   Fix the issues listed above then re-run /code-review.
```