# SmartCut Project Architecture

## Workspace

The repository contains the `apps/smartcutapp` Flutter application and the reusable `packages/sheet_viewer` package. The application depends on the package through a local path dependency.

## Application layers

Features live under `apps/smartcutapp/lib/features/`. A feature may use these layers:

| Layer | Typical contents | Responsibility |
| --- | --- | --- |
| `data/` | remote/local data sources, models, repository implementations | Convert API or local data into app data |
| `domain/` | repository contracts and use cases | Define feature operations and app-facing contracts |
| `presentation/` | views, view models, feature widgets | Render UI and coordinate user actions |

Some features are older or incomplete and do not contain every layer. Follow the existing structure when extending one; use the full separation above for new feature work.

## App-wide code

- `core/network/` contains `ApiClient`, Dio setup, interceptors, and response parsing.
- `core/error/` contains the `Failure` types and Dio error mapping.
- `core/router/` contains typed route declarations and generated route configuration.
- `core/theme/`, `core/enums/`, `core/extensions/`, and `core/util/` provide app-wide presentation and domain helpers.
- `shared/presentation/widgets/` contains reusable form fields, autocomplete, buttons, tables, headers, and status widgets.
- `features/features.dart` exports feature entry points; `main.dart` initializes dependencies and starts `MaterialApp.router`.

## Typical data flow

```text
View
  -> ChangeNotifier view model (Provider)
  -> domain use case
  -> repository contract
  -> repository implementation
  -> remote data source
  -> ApiClient / Dio
```

API results commonly use `Either<Failure, T>`. Remote responses are commonly wrapped in `ApiResponse<T>`. View models match on success/failure, update state, and notify listeners. Keep errors visible and use the failure message or the established app feedback pattern.

## Dependency injection and routes

Each feature usually has an injection file registering data sources, repositories, use cases, and view models with GetIt. `main.dart` calls feature initialization methods after core services are registered. Register dependencies before the feature that consumes them.

Typed routes are declared in `core/router/app_routes.dart`; route configuration is generated into `route_config.g.dart`. Update declarations and regenerate instead of hand-maintaining generated output.

## Reusable sheet viewer

`packages/sheet_viewer/lib/sheet_viewer.dart` is the package entry point. Its implementation is grouped under `lib/src/` by controllers, models, rendering, interactions, themes, utilities, and widgets. Keep app-specific business rules outside the reusable package.
