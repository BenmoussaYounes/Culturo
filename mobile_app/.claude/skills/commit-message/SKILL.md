# SKILL: commit-message
Trigger: /commit
Purpose: Generate a proper commit message from staged changes following the project Git conventions.

---

## Step 1 — Read the current branch

Run `git branch --show-current` and parse:
- **TaskType** → first segment
- **FeatureName** → second segment
- **IssueNumber** → number after `GH-`

If the branch does NOT follow `TaskType/FeatureName/GH-{N}-Description`, stop and warn:
```
⚠️ Branch name does not follow the required convention.
   Current branch: {branch-name}
   Please rename it before running /commit.
```

---

## Step 2 — Read what actually changed

Run `git diff --staged` to see staged changes.
If nothing is staged, run `git diff HEAD` instead.
If still nothing, warn:
```
⚠️ No changes detected. Stage your files with `git add` first.
```

Read every changed file and understand:
- What was added, removed, or modified
- Which layer it belongs to (data / logic / ui / core)
- What the intent of the change is

---

## Step 3 — Build the commit message

### Format:
```
type(scope) emoji short description

- bullet: what changed
- bullet: why if not obvious
- bullet: breaking change if any

Closes #IssueNumber
```

### Map TaskType → type + default emoji:

| TaskType | type | Default emoji |
|---|---|---|
| Feature | feat | ✨ |
| Bug | fix | 🐛 |
| HotFix | fix | 🚑 |
| Refactoring | refactor | ♻️ |
| Docs | docs | 📝 |

### Full emoji reference — pick the most specific:

| Intent | Emoji |
|---|---|
| New feature | ✨ |
| Bug fix | 🐛 |
| Critical hotfix | 🚑 |
| Refactor | ♻️ |
| Architecture change | 🏗️ |
| Tests | 🧪 |
| Documentation | 📝 |
| UI / styles | 🚀 |
| Performance | ⚡ |
| Remove code or files | 🔥 |
| Add dependency | ➕ |
| Remove dependency | ➖ |
| Upgrade dependency | ⬆️ |
| Downgrade dependency | ⬇️ |
| Config change | 🔧 |
| Security fix | 🔒 |
| CI/CD | 👷 |
| Revert | ⏪ |
| Code review feedback | 👌 |
| WIP | 🚧 |

### Rules:
- First line max 72 characters
- Present tense, imperative mood ("add" not "added", "fix" not "fixed")
- Scope is FeatureName in lowercase
- No period at end of first line
- Bullets describe WHAT changed and WHY — not HOW
- Always end with `Closes #IssueNumber`
- If multiple issues are closed: `Closes #12, #13`

---

## Step 4 — Show the message and ask for confirmation

Display the generated message clearly:

```
Generated commit message:
─────────────────────────────────────────────
feat(auth) ✨ add login use case and sealed states

- add LoginUseCase in domain layer with email validation
- implement sealed AuthState with Dart 3 switch expression
- map NetworkFailure to user-friendly message in cubit

Closes #12
─────────────────────────────────────────────

Confirm? (yes to commit / no to adjust)
```

Wait for user confirmation before doing anything.

---

## Step 5 — Output the git command

After confirmation, output this for the user to run — never run it automatically:

```bash
git commit -m "feat(auth) ✨ add login use case and sealed states

- add LoginUseCase in domain layer with email validation
- implement sealed AuthState with Dart 3 switch expression
- map NetworkFailure to user-friendly message in cubit

Closes #12"
```

---

## Examples

### Feature branch: `Feature/Auth/GH-12-Add-Login-Flow`
Changes: new use case file, new state file, cubit updated
```
feat(auth) ✨ add login flow with sealed states

- add LoginUseCase with email and password validation
- replace enum-based AuthState with sealed class variants
- use Dart 3 switch expression in AuthCubit for exhaustive matching

Closes #12
```

### Bug branch: `Bug/Onboarding/GH-21-Fix-Navigation-State`
Changes: BlocListener updated, state class renamed
```
fix(onboarding) 🐛 fix navigation state not triggering

- replace listenWhen filter with _ => null wildcard in switch
- rename NavigateState to NavigateToSignUpPageState for clarity

Closes #21
```

### Refactoring branch: `Refactoring/Core/GH-18-Remove-Freezed`
Changes: pubspec.yaml, multiple state files rewritten
```
refactor(core) ♻️ replace Freezed with native Dart 3 sealed classes

- remove freezed and build_runner from dev dependencies
- rewrite AuthState, OnboardingState, TaskState as sealed classes
- use switch expressions for exhaustive pattern matching throughout

Closes #18
```

### Multiple small changes on `Feature/Tasks/GH-33-Task-List-UI`
Changes: new widget, new view model, cubit updated
```
feat(tasks) 🚀 add task list UI with view model

- add TaskListItemViewModel in logic/view_models
- add TaskListItem widget reading pre-formatted vm fields
- update TaskListCubit to emit view models instead of raw entities

Closes #33
```