# XpeApp-Admin !

The XpeHo mobile administration application.

## PlantUML

You can find the PlantUML diagram here.

**XpeApp-Admin C4 diagram**

![XpeApp-Admin C4 diagram](http://www.plantuml.com/plantuml/png/VOzFQyCm3CNl-HHUJYbq3OETTchMCZReeEiVkbjH4hKnEBQnPReozjsdjEv2eSmdMVf9xxsn9t0KMYK-BHRMYg9kfKxkfAvKg34u9HeYwv_otC5Xj9VKX39uT9NHX9f6bMdplJPr-CedZ_Tp1PhMxxEy1K_ekBMTC0XIenjPbaaIgCWuaR9SOyvggG0luAIRB8-yrswVJT0rk6DMFGmxjhUM3iHt8lZztSqEM6x1MWOtM0ecbQo0fD4fjrvK84BNbQi61RC2UaBiZ8l9qq7o4-MpdNHOWiTkFvOyZiE3SRLrw7rXPQTv-OfY_dQ3cW91lDMZboRpoG9LTae_57sIjKVVUNvThUPBfXZgS_Rs_kUkdKQ6YybYFOtiDNBBz0AXzld6IJehBJzcl3j6NOTM_G80 "XpeApp-Admin C4 diagram")

**XpeApp-admin functional C4 diagram**

![XpeApp-admin functional C4 diagram](http://www.plantuml.com/plantuml/png/ZLJ1Rjiw4BphAnYT7E350XvwwYcgdQ85cjQ9dROtWnRNDX69PBbKdA3eltV9I0LfkgXzCMSqEyiTYRn6nwthkvPzDr0RKujEgk92ggRj1VIsPNld3BwjAiiFqvrq-txJ8zX6AmVAJHlTLJkbHVzSpTvSBLgktCFjfwhZwC0IjPwHa4i5TcgeIt4XO4k8lPSMDXnXGUGPBHx_Ft3rgAljK7ObwIbU6T-F7CP-8qu6Y5jL8vZfhjDgQiuIrstxgYmyWqvRc8mxcM_-O-MSE-v1IUlFSC0Md0EBvMLHBEXVgycp0MxCcljuIVGQDWjf-wAmaEWiTr8hfhTiK51Hv7BGLXWBY5JoRLoN2I3nyWKTTEjtkbU2svS9UNW9RBnRAvlGexnaFmj6lpyloEkYpH-DGl2MAxu3P2gPCFNeaTYLhfi64ElG-C5Jp6d60-at4Rlr-UD_k0uPPhwUF-citHxi860JkMM41xJdI4WYCs0xYKZ9N5BxB9Yx9tHaVVTrkOfRU4poNtdewcz9dWfUY3JuMeWavOpAWmSXNMfoGqpgadEPZG1w0gdHF737LZbxEeWVKN8dHn-YzGC6KRG-EQNNZwC4KGJoYiO2Tp3ZdU5ofqWw2mHh1gRCgSn36r2HmnU2INrAP3jeDIOR89psJvdCWDjcBvzYYpemgKd6XRTHt4ERt5NP8V-mMYsM93uMvYVvJAa_LwaulhV6ivGAqkkHZ_S6beEEP45tl7iLWQmY58pjXi-mNdnazpVqdKGRAAv1YRvhVmC0 "XpeApp-admin functional C4 diagram")

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

## Admin users

The way to define the admin list is documented in the bookstack of XpeApp.

## Deployment

In order to deploy the app, you need to be logged in to the Firebase CLI.

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

## Used library :

- [state management library](https://pub.dev/packages/flutter_riverpod) : State management
- [translation library](https://pub.dev/packages/easy_localization) : Traduction
- [API call library](https://pub.dev/packages/retrofit) : API Call
- [Serialization](https://pub.dev/packages/json_serializable) : Data Serialization (JSON)
- [Navigation](https://pub.dev/packages/go_router) : Manage navigation
- [Flutter SVG](https://pub.dev/packages/flutter_svg) : Dart implementations of SVG parsing
- [Shared Preferences](https://pub.dev/packages/shared_preferences) : Wraps platform-specific persistent storage for simple data
- [Mockito](https://pub.dev/packages/mockito) : Mock library for Dart
