---
name: flutter-setup-declarative-routing
description: Configure `MaterialApp.router` using a package like `go_router` for advanced URL-based navigation. Use when developing web applications or mobile apps that require specific deep linking and browser history support.
metadata:
  model: models/gemini-3.1-pro-preview
  last_modified: Tue, 21 Apr 2026 21:08:03 GMT
---
# Implementing Routing and Deep Linking

## Contents
- [Core Concepts](#core-concepts)
- [Workflow: Initializing the Application and Router](#workflow-initializing-the-application-and-router)
- [Workflow: Configuring Platform Deep Linking](#workflow-configuring-platform-deep-linking)
- [Workflow: Implementing Nested Navigation](#workflow-implementing-nested-navigation)
- [Examples](#examples)

## Core Concepts

Use the `go_router` package for declarative routing in Flutter.

- **GoRouter**: The central configuration object defining the application's route tree.
- **GoRoute**: A standard route mapping a URL path to a Flutter screen.
- **ShellRoute / StatefulShellRoute**: Wraps child routes in a persistent UI shell (e.g., a `BottomNavigationBar`). `StatefulShellRoute` maintains the state of parallel navigation branches.
- **Path URL Strategy**: Removes the default `#` fragment from web URLs, essential for clean deep linking across platforms.

## Workflow: Initializing the Application and Router

### Task Progress
- [ ] Create the Flutter application.
- [ ] Add the `go_router` dependency.
- [ ] Configure the URL strategy for web/deep linking.
- [ ] Implement the `GoRouter` configuration.
- [ ] Bind the router to `MaterialApp.router`.

### 1. Scaffold the Application
```bash
flutter create <app-name>
cd <app-name>
flutter pub add go_router
```

### 2. Configure the Router

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'details/:id',
          builder: (context, state) => DetailsScreen(id: state.pathParameters['id']!),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Routing App',
    );
  }
}
```

## Workflow: Configuring Platform Deep Linking

### Task Progress
- [ ] Determine target platforms (iOS, Android, or both).
- [ ] Apply conditional configuration for Android (Manifest + Asset Links).
- [ ] Apply conditional configuration for iOS (Plist + Entitlements + AASA).
- [ ] Run validator -> review errors -> fix.

### If configuring for Android:
1. **Modify `AndroidManifest.xml`**:
```xml
<intent-filter android:autoVerify="true">
    <action android:name="android.intent.action.VIEW" />
    <category android:name="android.intent.category.DEFAULT" />
    <category android:name="android.intent.category.BROWSABLE" />
    <data android:scheme="https" android:host="yourdomain.com" />
</intent-filter>
```
2. **Host `assetlinks.json`** at `https://yourdomain.com/.well-known/assetlinks.json`.

### If configuring for iOS:
1. **Modify `Info.plist`**:
```xml
<key>FlutterDeepLinkingEnabled</key>
<true/>
```
2. **Modify `Runner.entitlements`**:
```xml
<key>com.apple.developer.associated-domains</key>
<array>
  <string>applinks:yourdomain.com</string>
</array>
```

## Workflow: Implementing Nested Navigation

Use `StatefulShellRoute` for persistent UI shells (like a bottom navigation bar).

```dart
final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [GoRoute(path: '/home', builder: (context, state) => const HomeScreen())],
        ),
        StatefulShellBranch(
          routes: [GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen())],
        ),
      ],
    ),
  ],
);
```

## Examples

### Shell Widget Implementation

```dart
class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
```

### Programmatic Navigation

```dart
context.go('/details/123');        // Replace stack
context.push('/details/123');      // Push onto stack
context.goNamed('details', pathParameters: {'id': '123'});
context.pop();
```
