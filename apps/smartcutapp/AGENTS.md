# SmartCut Flutter App Agent Guide

## Structure

- `lib/core/` contains app-wide networking, errors, routing, enums, extensions, theme, and utilities.
- `lib/shared/` contains reusable widgets and shared models.
- `lib/features/<feature>/` contains feature-specific code, commonly split into `data/`, `domain/`, and `presentation/`.
- `lib/features/features.dart` is the feature export barrel.
- `lib/main.dart` initializes app dependencies before launching the router.

## Feature conventions

- Keep screens in `presentation/views`, state in `presentation/view_models` (some older features may use a different established spelling), use cases and repository contracts in `domain`, and API/model implementations in `data`.
- Keep each use case responsible for exactly one operation and expose one operation method. Create separate use cases for separate actions such as create, update, delete, or fetch; do not combine them in a generic save use case.
- Define app data models with Freezed and JSON serialization. Edit the model declaration and regenerate its `.freezed.dart` and `.g.dart` files; do not hand-write parallel model classes or edit generated files directly.
- Use `ChangeNotifier` with Provider for screen state and GetIt for dependency injection, matching neighboring features.
- For API reads and writes, follow `ApiClient`, `ApiResponse`, `Either<Failure, T>`, and repository patterns already present in the feature area.
- Persist authentication tokens with `flutter_secure_storage` and apply them through the shared `AuthInterceptor`; do not store tokens in plain preferences or API feature state.
- Keep API hosts configurable with the `API_BASE_URL` Dart define. Platform development defaults may use emulator-specific loopback addresses; physical devices and deployed builds must use a host reachable from that device.
- Prefer `AutoCompleteWidget` and shared form/button/table widgets over duplicating their behavior. Pass validators, filtering, and selection callbacks through any helper wrappers.
- Before adding or changing form controls, inspect `lib/shared/` and nearby feature forms. Use `TextFormFieldWidget` for text and numeric inputs and `AutoCompleteWidget` for searchable choices when they fit. Do not substitute native Flutter fields or dropdowns where a shared widget already covers the behavior. If the needed reusable control does not exist, add it under `lib/shared/` and use it from the feature.
- Reuse domain enums from `lib/core/enums/` in models and UI instead of inventing parallel string values. Keep status fields typed with their existing enum (for example, `ItemStatus`) and use the established label/color helpers.
- Treat the API schema and backend behavior as authoritative. Leave backend-calculated fields out of create/update forms and payloads; display their returned values in details where useful.
- After a successful create or update, refresh the owning list/view model and verify both create and edit paths. Ensure the refreshed data is available when returning to the list.
- Keep responsive behavior aligned with `BaseStatefulScreen`, `ScreenType`, and shared responsive helpers.
- Shell screens get their title, back/menu control, and account action from `BasePage`; do not add duplicate page app bars or title headers. Keep `DialogHeaderWidget` for dialogs.
- Use the registered Montserrat family through `AppTextStyle` and the app theme. Avoid setting another font family or relying on a platform default. Text widgets inherit Montserrat from the app theme; text drawn with `TextPainter` or a canvas renderer must set `AppTextStyle.fontFamily` explicitly.
- Surface failures to users with the existing `Failure` messages and app feedback patterns. Do not silently swallow failures.

## Machine management

- Machines are factory-owned production equipment, not inventory hardware. Keep the API-generated code read-only in the UI; create payloads must not include `code`.
- Keep machine types aligned with the backend enum: `CNC`, `PANEL_SAW`, `EDGE_BANDER`, `DRILLING`, and `OTHER`. Model API data with Freezed and JSON serialization, including the optional factory summary returned by machine endpoints.
- A machine kerf is an optional non-negative millimeter override. Blank on create means use the factory default; clearing an existing override sends `kerf: null`.
- The machine list is company-scoped by the backend and refreshes after successful mutations. Factory selection must come from the authenticated company’s factory list.
- Keep the Machines and Factories drawer links selected by their exact route segment; they share permissions but are separate destinations.

## Generated files and routes

- Router declarations live in `lib/core/router/app_routes.dart`; `route_config.g.dart` is generated from those declarations.
- Freezed and JSON serialization sources have generated `.freezed.dart` and `.g.dart` companions.
- Change the source declaration first, then regenerate with `dart run build_runner build --delete-conflicting-outputs` from this app directory when needed.
- Dependency registrations belong in the feature's injection file and must be initialized from `main.dart` in dependency order.

## Commands

Run commands from `apps/smartcutapp/`:

```sh
flutter pub get
dart format lib/path/to/changed_file.dart
flutter analyze
flutter test
dart run build_runner build --delete-conflicting-outputs
```

Use `flutter analyze` for static validation and `flutter build web` when the app must be compiled for its web target. Use `flutter test` when tests are requested or needed to verify an implementation. Only run code generation when generated sources need to change.

The reusable `packages/sheet_viewer/` package has its own `AGENTS.md`; read it before changing that package. Keep app-specific workflows and API calls in the app, not in the reusable viewer.
