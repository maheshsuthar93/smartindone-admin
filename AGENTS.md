# Repository Agent Guide

## Repository map

- `apps/smartcutapp/` is the main Flutter application.
- `packages/sheet_viewer/` is a reusable Flutter package used by the app.
- `docs/` contains architecture and workflow reference material.

Read the closest nested `AGENTS.md` before changing files in a subtree. The app and package have their own instructions.

## General practices

- Keep changes within the feature or package that owns the behavior.
- Follow existing naming, formatting, state management, and error handling in nearby code.
- Avoid unrelated cleanup and do not edit generated files by hand when a source file can be changed and code generation run instead.
- Keep API details and assumptions explicit; do not invent endpoints or payload fields when the contract is unknown.
- Update documentation when an architectural convention changes.

## Validation

- Format changed Dart files.
- Run the narrowest useful analyzer or tests when the task asks for verification or when implementation changes need validation.
- Report what was run and any environment limitation.

## Documentation

- Keep the workspace `README.md` and this `AGENTS.md` at the repository root.
- Keep architecture and reusable workflow documentation under `docs/`.
- Before changing app or package code, read the closest nested `AGENTS.md`; keep those guides beside the code they govern.
- When documenting a workflow, name the source directories and layer responsibilities, explain data flow and dependency registration points, keep commands scoped to the owning app or package, and update examples when the structure changes.
- Treat the architecture notes as descriptive of the current implementation. Call out unknown API contracts instead of guessing fields or endpoints.
