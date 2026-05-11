# CLAUDE.md

<!--
This file loads into context on EVERY message in this project.
Apply the Golden Test before adding any rule:
"Would removing this cause Claude to make mistakes?" If not — cut it.
Do not restate language defaults Claude already knows. Only write rules
that override defaults or encode decisions specific to this project.
-->

---

# Section A — General Engineering Rules

## 1) Architecture & Separation of Concerns (YOU MUST FOLLOW)

This project follows Flutter's official MVVM architecture:

```
UI layer  →  Domain layer (optional)  →  Data layer
(View + ViewModel)     (use cases)      (repositories + services)
```

Layer responsibilities:
- **UI layer**: Views (widgets) + ViewModels (Cubits). Views render state exposed by ViewModels. ViewModels transform data into UI state and handle user events.
- **Domain layer** _(optional — only add when necessary, see Rule 4)_: Use cases and repository contracts. Pure Dart — no Flutter imports. Contains business rules that would otherwise be duplicated or are too complex to live in the ViewModel.
- **Data layer**: Repository implementations + services. Services wrap individual data sources (APIs, databases, platform APIs). Repositories are the single source of truth.

Rules:
- Never bypass layers or mix responsibilities
- Views contain ZERO business logic — only rendering, layout, and user interaction forwarding
- ViewModels contain all logic related to data transformation, UI state management, and command handling
- Do not introduce new abstractions or patterns without justification

## 2) Shared Code (IMPORTANT)
- Any reusable logic, utility, constant, extension, or helper used in 2+ places goes in `core/`
- Check `core/` before creating new shared code — never duplicate across features

## 3) Error Handling
- Errors flow cleanly across layers — never skip layers
- Handle null, empty, loading, and error states explicitly — no silent failures
- Catch errors at the boundary (data layer), not deep inside business logic

## 4) Change Discipline
- Make the smallest change that solves the problem
- Fix root causes, not symptoms
- Don't refactor unrelated code unless explicitly requested
- Never break existing functionality, APIs, flows, or UX unless explicitly instructed
- Read relevant code before modifying it — state assumptions when unclear

## 5) Dependencies
- Don't add new packages without justification
- Any new package must be: latest stable, well-maintained, production-grade

## 6) Security
- Never hardcode secrets, tokens, or credentials
- Never log sensitive information
- Validate all external and API input
- Proactively flag security risks when spotted

## 7) Testing
- Write tests for domain and data layer
- Bug fixes must include a reproducing test
- Tests must be deterministic — no flaky or timing-dependent tests
- One behavior per test case

## 8) Workflow (Mandatory)
- PR descriptions must always be in markdown (`.md`) format

---

# Section B — Flutter / Dart Specific Rules

<!--
Follow official Dart style guide, Effective Dart, and `flutter_lints` defaults.
Rules below only cover things that OVERRIDE defaults or encode decisions specific to this project.
-->

## 1) MVVM — ViewModel Rules (IMPORTANT)

- Use **Cubit** as the ViewModel — one Cubit per screen (one-to-one relationship with its View)
- The Cubit (ViewModel) is responsible for:
  - Retrieving data from use cases or repositories
  - Transforming and formatting data into UI-ready state (display labels, flags, colors tokens)
  - Maintaining the current UI state so the view can rebuild without losing data
  - Exposing commands that views call in response to user interaction
- Cubits depend on use cases when the domain layer exists — if no domain layer, Cubits may depend directly on repositories
- The Cubit's state IS the display model — state classes carry pre-formatted, UI-ready fields
- `setState` is allowed ONLY for local UI state (e.g., toggles, form focus) — never for business logic
- Keep `setState` scoped to the smallest widget possible to avoid redundant rebuilds up the tree

## 2) MVVM — View Rules

- Views (widgets) are pure renderers — they display state exposed by the ViewModel and forward events to it
- Views must NOT transform, format, or compute data — all of that belongs in the Cubit
- Views and ViewModels have a one-to-one relationship — one screen = one Cubit
- `BlocBuilder`/`BlocSelector` placed on the smallest widget that needs the state — never at the top of the tree

## 3) No Code Generation
- **No Freezed. No build_runner.** Use Dart 3+ native features instead:
  - `sealed class` for state unions with exhaustive pattern matching
  - `switch` expressions and records for lightweight data

## 4) Domain Layer — Optional, Add Only When Necessary

The domain layer is **optional**. Do NOT add it by default — only introduce it when one of these conditions is met:
- The same business logic would be duplicated across two or more Cubits
- A use case merges or coordinates data from multiple repositories
- Business rules are complex enough that keeping them in the ViewModel makes it hard to read or test

When the domain layer exists:
- It must have ZERO Flutter imports
- No `package:flutter/...` in any file under `domain/`
- Use cases return `ApiResult<T>` — never throw across layers
- Repository contracts (abstract classes) live here, implementations live in `data/`

When the domain layer does NOT exist:
- Cubits depend directly on repositories
- Simple data transformation happens inside the Cubit
- Repository contracts can live directly in `data/`

## 5) Feature Folder Structure

```
features/{feature_name}/
├── data/
│   ├── services/          ← wrap individual data sources (API endpoints, DB, platform)
│   ├── dtos/              ← data transfer objects, JSON parsing
│   └── repositories/      ← repository implementations, single source of truth
│
├── domain/                ← OPTIONAL — pure Dart, zero Flutter imports
│   ├── entities/          ← business objects
│   ├── repositories/      ← abstract repository contracts
│   └── usecases/          ← only add when logic would be duplicated or is complex
│
└── ui/
    ├── cubit/             ← ViewModel: state holder + data transformer
    │   ├── {name}_cubit.dart
    │   └── {name}_state.dart   ← carries pre-formatted, UI-ready fields
    ├── screens/           ← one file per screen (layout + composition only)
    └── widgets/           ← screens-specific widgets
```

- Screen files focus on layout and composition only — no widget implementation inline
- Screen-specific widgets live in `widgets/`
- if we have 1 screen only in the feature add the screen directly into ui no need to create a folder for screens

## 6) Error Handling Contract
- Data layer: catch exceptions and map to typed `Failure` classes
- Domain layer (when it exists): return `ApiResult<T>` from use cases and repositories
- UI layer (Cubit): map failures to user-friendly messages and UI states — never pass raw error strings up from the data layer

## 7) Dependency Injection
- Use **`get_it`** as the service locator — not `Provider` or constructor-only injection
- Register dependencies in a single `core/di/` setup file
- Cubits, use cases (when they exist), and repositories are resolved via `get_it`, not instantiated manually
- Repositories and ViewModels (Cubits) have a many-to-many relationship — one Cubit can use several repositories or use cases, one repository can serve many Cubits

## 8) Icons & Custom Graphics (IMPORTANT)
- Avoid `CustomPainter` unless there is no viable alternative — it is hard to maintain and debug
- Always prefer SVG or PNG assets for icons and custom graphics
- If an asset is missing from the repo, ask the user to upload it — never recreate it via `CustomPainter`

## 9) Typography (IMPORTANT)
- Never hardcode font families, font sizes, font weights, or text styles directly in the UI
- Always use the text styles and constants defined in `lib/core/theming/`
- If a new font or style is needed, add it to the appropriate file in `lib/core/theming/` first, then import it in the UI

## 10) Build Method Discipline (IMPORTANT)
- Prefer `const` constructors wherever possible
- NEVER create `TextEditingController`, `AnimationController`, `FocusNode`, or other expensive objects inside `build()`
- Avoid heavy work inside `build()` methods
- Dispose controllers and focus nodes in `StatefulWidget.dispose()`
- Prefer small, composed widgets to minimize rebuild scope
- UI files must not exceed 200 lines — if a file approaches this limit, extract sections into dedicated widget classes
- Only extract widgets when the file actually needs it — do not split prematurely