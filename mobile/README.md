# Xmartchat

## Arch Overview 

The project is divided into two main folders:
- The UI contains all app screens.
- The Core contains the models and the data layer.

### UI section

[Flutter Bloc][bloc] is used for state management, specifically, we use Cubit to manage the screen state.
Each app section is added in a project folder which contains three components, the Screen (a `StatelessWidget`, the UI), the Cubit and the state.

The `MainScreen` is the Widget that contains all screens. It defines the `MaterialApp` and provides the app router.
The router has two subgraphs, the `UnauthenticatedRouter` used for unauthenticated users and the `AuthenticatedRouter` used for authenticated users.

The [app router][app_router] is provided by [auto_route][auto_route], and contains the previous sections with some nested screens.

The [theme folder][theme] contains the theme definitions, for example colors, styles and dimensions. 
Another important plugin related to the UI is [flutter_screenutil][flutter_screenutil], used for adapting screen and font size.

### Core section

The models are defined in the [models folder][models]. If you need to use different models for networking, you can create them in `service` folder.

The repository pattern is used to manage the data layer.
A [repository][repository_folder] uses different [data sources][data_source_folder] (for example a local cache or the Supabase SDK).
These components are injected in the Cubits using [get_it][get_it].

## Project Overview

### Assets
The [`/assets/`](./assets) folder contains the assets used by the application, such as images, fonts, and other files.

### Environments

The environment variables are defined in the `default.env` file located in [`/environments/`](./environments) folder.
You can read more information about the environment variables in the [README.md](./environments/README.md) file.

### Pre Push config

In order to setup pre-push hook you need to go to the root of the project and run `git config core.hooksPath .github/hooks`

[flavorizr]: https://pub.dev/packages/flutter_flavorizr
[flutter_launcher_icons]: https://pub.dev/packages/flutter_launcher_icons
[flutter_native_splash]: https://pub.dev/packages/flutter_native_splash
[pubspec]: ./pubspec.yaml
[app_router]: lib/ui/router/app_router.dart
[bloc]: https://bloclibrary.dev
[auto_route]: https://pub.dev/packages/auto_route
[theme]: lib/ui/theme
[flutter_screenutil]: https://pub.dev/packages/flutter_screenutil
[models]: lib/core/model
[repository_folder]: lib/core/repository
[data_source_folder]: lib/core/source
[get_it]: https://pub.dev/packages/get_it
