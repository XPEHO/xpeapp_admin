# XpeApp-Admin !

The XpeHo mobile administration application.

## Requirement

- An IDE : [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)
- [Flutter](https://docs.flutter.dev/get-started/install)
- A _config.json_ file in _assets_ directory containing the backend url :

  ```json
  {
    "baseUrl": "https://example.com"
  }
  ```

- A _firebase_options.dart_ file in _lib_ directory.

  To generate the _firebase_options.dart_ file automatically using the FlutterFire CLI, follow these steps:

  1. Install FlutterFire CLI: Ensure you have the FlutterFire CLI installed. You can install it globally using the following command:

     ```bash
     dart pub global activate flutterfire_cli
     ```

  2. Configure Firebase: Run the following command to configure Firebase for your Flutter project:

     ```bash
     flutterfire configure
     ```

     This command will guide you through the process of selecting your Firebase project and platforms. It will automatically generate the _firebase_options.dart_ file in the lib directory.

## Used library :

- [state management library](https://pub.dev/packages/flutter_riverpod) : State management
- [translation library](https://pub.dev/packages/easy_localization) : Traduction
- [API call library](https://pub.dev/packages/retrofit) : API Call
- [Serialization](https://pub.dev/packages/json_serializable) : Data Serialization (JSON)
- [Navigation](https://pub.dev/packages/go_router) : Manage navigation
- [Flutter SVG](https://pub.dev/packages/flutter_svg) : Dart implementations of SVG parsing
- [Shared Preferences](https://pub.dev/packages/shared_preferences) : Wraps platform-specific persistent storage for simple data
- [Mockito](https://pub.dev/packages/mockito) : Mock library for Dart
