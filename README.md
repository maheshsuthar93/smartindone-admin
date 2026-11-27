# SmartCut Frontend Workspace

This workspace contains the SmartCut Flutter application and its reusable sheet viewer package.

## Projects

- [`apps/smartcutapp/`](apps/smartcutapp/): primary Flutter application.
- [`packages/sheet_viewer/`](packages/sheet_viewer/): reusable sheet layout viewer used by the app.

## Documentation

- [Architecture and data flow](docs/architecture.md)
- [Workspace agent guidance](AGENTS.md)
- [Flutter app guide](apps/smartcutapp/AGENTS.md)
- [Sheet viewer package guide](packages/sheet_viewer/AGENTS.md)

## Getting started

Use the Flutter app directory for app commands:

```sh
cd apps/smartcutapp
flutter pub get
flutter analyze
flutter run
```

For generated routes or Freezed/JSON model changes, update the source declarations first and run `dart run build_runner build --delete-conflicting-outputs` from `apps/smartcutapp/`.

For sheet viewer package work, use commands from `packages/sheet_viewer/`; see its local README and `AGENTS.md`.
