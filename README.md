# XpeApp - Flutter admin panel

## Description

This is the web administration panel for the XpeApp project made with Flutter.

## Getting Started

### Prerequisites

- Flutter SDK
- VS Code

### Flutter

This is a Flutter project. You can open it with VS Code and run it on your favorite browser.

For more information about flutter development, please refer to the [official documentation](https://docs.flutter.dev/).

### Dart

Dart is the programming language used for this project. For more information about Dart, please refer to the [official documentation](https://dart.dev/guides).

## Configuration

### firebase_options.dart

This file is required in _lib/_ directory to use Firebase services.

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

### config.json

This file is required in _assets/_ directory to define the backend url. Here is an example of its content :

```json
{
  "baseUrl": "https://example.com/"
}
```

### admin.json

This file is required in _assets/_ directory. The way to define this file is documented in the bookstack of XpeApp. In case of problem, refer to an administrator.

## SonarQube

The XPEHO SonarQube perform analysis each time changes are made to this directory and pushed.

[XPEHO SonarQube](https://sonar.infra.xpeho.com)

The configuration of the sonar analysis for this directory is defined in a [dedicated file](./sonar-project.properties).

## Deployment

In order to deploy the app, you need to be logged in to the Firebase CLI with an account that have sufficient rights to write on the hosting of this project.

### Login to the Firebase CLI

To install the Firebase CLI you can type :

```bash
npm install -g firebase-tools
```

And then login with :

```bash
firebase login
```

### Deploy to the Firebase Hosting

Firstly, you need to init the project for hosting with Firebase CLI :

```bash
firebase init
```

> [!WARNING]  
> Make sure to select _build/web_ as public directory.

After that you can type the following command to build your Flutter web app :

```bash
flutter build web
```

And finally type the following command to deploy the app to firebase hosting :

```bash
firebase deploy
```

## Used libraries

- [state management library](https://pub.dev/packages/flutter_riverpod) : State management
- [translation library](https://pub.dev/packages/easy_localization) : Traduction
- [API call library](https://pub.dev/packages/retrofit) : API Call
- [Serialization](https://pub.dev/packages/json_serializable) : Data Serialization (JSON)
- [Navigation](https://pub.dev/packages/go_router) : Manage navigation
- [Flutter SVG](https://pub.dev/packages/flutter_svg) : Dart implementations of SVG parsing
- [Shared Preferences](https://pub.dev/packages/shared_preferences) : Wraps platform-specific persistent storage for simple data
- [Mockito](https://pub.dev/packages/mockito) : Mock library for Dart
