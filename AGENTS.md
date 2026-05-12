# AGENTS.md

## Repo Type
- Flutter app (see `pubspec.yaml`, Dart SDK `^3.11.5`).

## Commands (Source Of Truth)
- Install deps: `flutter pub get`
- Static checks: `flutter analyze`
- Run tests: `flutter test`
- Run one test file: `flutter test test/widget_test.dart`
- Run app: `flutter run` (or `flutter run -d chrome` for web)

## Code Entry Points
- App entrypoint: `lib/main.dart` (`MiAplicacion` is the root widget).
- Theme system lives under `lib/tema/**`.
- Theme definitions: `lib/tema/tema_general.dart` (`TemaGeneral.temaClaro` / `TemaGeneral.temaOscuro`).
- Shared design tokens: `lib/tema/colores_app.dart`, `lib/tema/tipografia_app.dart`.

## Known Gotchas (Verified In Repo)
- `lib/tema/export.dart` exports `package:tema_personalizado/...`, but `pubspec.yaml` names the package `themes`.
  If you switch files to `package:` imports, use `package:themes/...` (or keep using relative imports) or builds/analyzer will break.
- `test/widget_test.dart` is still the Flutter template: it imports `MyApp` and asserts a counter UI that does not exist in `lib/main.dart`.
  Expect `flutter test` to fail until the test is updated/replaced.

## Android Build Quirk
- `android/settings.gradle.kts` hard-requires `flutter.sdk` from `android/local.properties`.
  If Android Gradle tasks fail with "flutter.sdk not set", run `flutter run` once (or recreate `android/local.properties`).
- Toolchain pinned in Gradle config: Java 17, Gradle 8.14 (`android/gradle/wrapper/gradle-wrapper.properties`).
