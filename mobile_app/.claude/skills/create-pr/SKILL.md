# SKILL: create-pr
Trigger: /create-pr
Purpose: Create a branch, commit, and produce a PR description after /code-review passes.

---

## Prerequisites
- /code-review must have run and returned ✅ or ⚠️
- Never run if /code-review returned ❌

---

## Step 1 — Extract context from current branch

Run `git branch --show-current` to get the current branch name.

Parse the branch name using the project convention:
```
TaskType/FeatureName/GH-{IssueNumber}-Description
```

Extract automatically:
- **TaskType** → first segment (Feature, Bug, Refactoring, HotFix, Docs)
- **FeatureName** → second segment (Auth, Onboarding, Tasks, etc.)
- **IssueNumber** → number after `GH-`
- **Description** → everything after `GH-{N}-`

### Examples of what to extract:

| Branch | TaskType | Feature | Issue | Description |
|---|---|---|---|---|
| `Feature/Auth/GH-12-Add-Login-Flow` | Feature | Auth | 12 | Add Login Flow |
| `Bug/Onboarding/GH-21-Fix-Navigation` | Bug | Onboarding | 21 | Fix Navigation |
| `Refactoring/Core/GH-18-Sealed-States` | Refactoring | Core | 18 | Sealed States |

If the branch name does NOT follow this convention, stop and warn:
```
⚠️ Current branch name does not follow the required convention:
   TaskType/FeatureName/GH-{IssueNumber}-Description

   Current branch: {branch-name}
   Please rename it before running /create-pr.
```

---

## Step 2 — Determine commit message

Build the commit message from the extracted branch context.

### Format:
```
type(scope) :emoji: clear and concise message

- bullet: what changed
- bullet: why if not obvious
- bullet: breaking changes if any

Closes #IssueNumber
```

### Map TaskType → commit type + emoji:

| TaskType | Commit type | Default emoji |
|---|---|---|
| Feature | feat | ✨ |
| Bug | fix | 🐛 |
| HotFix | fix | 🚑 |
| Refactoring | refactor | ♻️ |
| Docs | docs | 📝 |

### Full emoji reference (pick the most specific one):

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
- Present tense, imperative mood ("add feature" not "added feature")
- Scope is the FeatureName in lowercase (auth, onboarding, tasks, etc.)
- No period at the end of the first line
- Always close the issue at the end with `Closes #N`

### Built examples from branch name:

Branch: `Feature/Auth/GH-12-Add-Login-Flow`
```
feat(auth) ✨ add login flow

- add LoginUseCase in domain layer
- implement AuthRepositoryImpl in data layer
- use sealed AuthState with Dart 3 switch expression

Closes #12
```

Branch: `Bug/Onboarding/GH-21-Fix-Navigation-State`
```
fix(onboarding) 🐛 fix navigation state handling

- replace NavigateToSignUpPageState string routing with sealed states
- use _ => null wildcard to handle unrelated states in BlocListener

Closes #21
```

Branch: `Refactoring/Core/GH-18-Replace-Freezed-Sealed`
```
refactor(core) ♻️ replace Freezed with native sealed classes

- remove build_runner and freezed from dev dependencies
- rewrite all state classes using Dart 3 sealed class syntax
- use switch expressions for exhaustive pattern matching

Closes #18
```

Ask the user to confirm the commit message before proceeding.

---

## Step 3 — Output the PR description as a markdown file

Filename: `PR_DESCRIPTION.md`

Use EXACTLY the project's GitHub PR template below.
Fill every section based on the actual changes made.
Never leave placeholder text unfilled.

```markdown
## GitHub Issue

Closes GH-{IssueNumber}

## Description 📑

{2-3 sentences describing what this PR does and why.
Be specific — mention the feature, the layer it touches, and the problem it solves.}

## Type of Change

Please check the relevant option(s):

- [ ] ✨ New feature (non-breaking change that adds functionality)
- [ ] 🐛 Bug fix (non-breaking change that fixes an issue)
- [ ] ❌ Breaking change (fix or feature that changes existing behavior)
- [ ] ♻️ Code refactor (no functional changes)
- [ ] 🏗️ Build / CI / configuration change
- [ ] 📝 Documentation
- [ ] 🧹 Chore / maintenance

## Changes

This Pull Request includes the following changes:

- {change 1}
- {change 2}
- {change 3 — add more as needed}

## Screenshots 📷 (if applicable)

| 01                                    | 02                                    | 03                                    | 04                                    |
| ------------------------------------- | ------------------------------------- | ------------------------------------- | ------------------------------------- |
| <img src="" width="100" height="250"> | <img src="" width="100" height="250"> | <img src="" width="100" height="250"> | <img src="" width="100" height="250"> |
```

### Rules for filling the template:
- **GitHub Issue** → use the IssueNumber extracted from the branch name in Step 1
- **Description** → write clearly what the PR does, no vague language
- **Type of Change** → check ALL that apply based on the actual changes
- **Changes** → list every meaningful change, one bullet per file or concern
- **Screenshots** → fill image src if UI changed, otherwise remove the table entirely

---

## Step 4 — Output git commands

Output these for the user to run — never run them automatically:

```bash
# 1. Stage all changes
git add .

# 2. Commit with the confirmed message
git commit -m "type(scope) emoji short description

- bullet one
- bullet two

Closes #N"

# 3. Push the branch
git push origin TaskType/FeatureName/GH-N-Description
```

Note: no `git checkout -b` here — the branch already exists (extracted in Step 1).

---

## Step 5 — Final summary

```
╔══════════════════════════════════════════════════════════╗
║  PR READY                                                ║
╠══════════════════════════════════════════════════════════╣
║  Issue:    #12                                           ║
║  Branch:   Feature/Auth/GH-12-Add-Login-Flow             ║
║  Commit:   feat(auth) ✨ add login flow                  ║
║  PR file:  PR_DESCRIPTION.md                             ║
╚══════════════════════════════════════════════════════════╝

Next steps:
1. Run the git commands above
2. Open a PR on GitHub
3. Paste the content of PR_DESCRIPTION.md as the PR body
4. Link the PR to Issue #12
5. Request a review
```