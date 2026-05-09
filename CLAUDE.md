# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**Culturo** is a Flutter mobile app targeting Android and iOS. The codebase lives entirely under `mobile_app/`. All Flutter commands must be run from that directory.

## Common Commands

All commands run from `mobile_app/`:

```bash
# Install dependencies
flutter pub get

# Run on a connected device / emulator
flutter run

# Run tests
flutter test

# Run a single test file
flutter test test/widget_test.dart

# Analyze / lint
flutter analyze

# Regenerate native splash screens (after editing flutter_native_splash.yaml)
dart run flutter_native_splash:create

# Regenerate launcher icons (after editing flutter_launcher_icons config in pubspec.yaml)
dart run flutter_launcher_icons
```

## Architecture

The app follows a **feature-first** folder structure under `lib/`:

```
lib/
  main.dart               # Entry point — bootstraps MyApp
  core/
    routing/
      routes.dart         # Route name constants (Routes class)
      app_router.dart     # AppRouter — switch-based route generator
    theming/
      colors_manager.dart # ColorsManager — static color palette constants
  features/
    onboarding/
      ui/
        onboarding_screen.dart
```

**Routing** uses Flutter's `Navigator 1.0` (`MaterialPageRoute`) via `AppRouter.generateRoute`. New screens must:
1. Add a route constant to `Routes`.
2. Add a `case` in `AppRouter.generateRoute`.

**Theming** — colors are centralized in `ColorsManager`; use its static constants instead of inline `Color(...)` values. Splash screen color (`#F3EAD8`) is configured in `flutter_native_splash.yaml`.

## Key Packages

| Package | Purpose |
|---|---|
| `flutter_screenutil` | Responsive sizing — wrap `MaterialApp` with `ScreenUtilInit` and use `.w`/`.h`/`.sp` extensions |
| `google_fonts` | Runtime Google Fonts — use `GoogleFonts.<name>()` as a `TextStyle` |
| `get_it` | Service locator for DI — register dependencies in a setup function and retrieve via `GetIt.instance<T>()` |
| `flutter_native_splash` | Native splash screen; config in `flutter_native_splash.yaml` |
| `flutter_launcher_icons` | App icon generation; config in `pubspec.yaml` |
| `flutter_lints` | Lint rules via `analysis_options.yaml` |
