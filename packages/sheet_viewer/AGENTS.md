# Sheet Viewer Package Agent Guide

## Scope

This directory is a reusable Flutter package, not an app feature. Its public API is exported from `lib/sheet_viewer.dart`; implementation lives under `lib/src/`.

## Design conventions

- Keep rendering, interaction, controllers, models, themes, and widgets in their existing `lib/src/` areas.
- Preserve the public API unless a requested change requires an intentional API update.
- Keep the package font-agnostic. Canvas text should use `SheetViewerThemeData` styles, and the widget should inherit the surrounding app's font family when those styles do not specify one.
- Keep geometry and gesture behavior independent from app-specific feature state where possible.
- Add or update package tests under `test/` for behavior changes when verification is requested.
- Keep the `example/` app working when public widgets or constructor APIs change.

## Commands

Run commands from `packages/sheet_viewer/`:

```sh
flutter pub get
dart format lib test
flutter analyze
flutter test
```
