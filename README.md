# Base project for flutter

# run to generated code with buiild_runner and freezed

- You setup build environment for the first time.
- You modified any code with the annotation `@freezed`.

```
flutter pub run build_runner build --delete-conflicting-outputs
```

```
flutter pub run intl_utils:generate
```

# Included modules:

1. Common API: Http/ Dio
2. Authorization
   - login/ logout/ change pass
   - login Facebook, google, apple
3. Common View
   - Theme - Appbar.
   - Dashboard.
   - Scroll View with refresh/ load more
   - Web view
4. Util
   - Navigation,
   - Validate
   - Download/ upload
   - Refresh/ Load more
5. Notification
6. Take picture
7. Google Analytis
8. OTP/ Capcha
9. Qr code
10. Play video

# Common rules folow dart standard

1. Naming convention:

- name file use snake case
- name class/ variable/ function use camel case

2. Common styles

- Declare common color/ textstyle/ dimension... in app_style.dart
- If the styles have just used locally in one screen one time it can be used as hard code
- Declare as constant in ahead of class if multiple use in one screen
- If these styles used multiple screen in one function such as login, put them in login/component/login_styles.dart

# Configuration firebase APP at firebase_options files in env/firebase/

- This way is recommended by Firebase and works with almost plugin for example GG Analytics and Crashlytics.
- But some plugin have issue and required manual installation such as google_sign_in.
- See more: https://firebase.flutter.dev/docs/cli/#usage

# CLI flutterfire to create app firebase

```shell script
flutterfire config \
  --project=provider-base-dev \
  --out=lib/env/firebase/firebase_options_dev.dart \
  --ios-bundle-id=com.example.providerBase.dev \
  --android-app-id=com.example.providerBase.dev

  flutterfire config \
  --project=provider-base-stg \
  --out=lib/env/firebase/firebase_options_stg.dart \
  --ios-bundle-id=com.example.providerBase.stg \
  --android-app-id=com.example.providerBase.stg


  flutterfire config \
  --project=provider-base-prod \
  --out=lib/env/firebase/firebase_options.dart \
  --ios-bundle-id=com.example.providerBase \
  --android-app-id=com.example.providerBase
```

# How to run

### Debug

```shell script
flutter run --debug --flavor development -t lib/main/main_development.dart
flutter run --debug --flavor staging -t lib/main/main_staging.dart
flutter run --debug --flavor production -t lib/main/main_production.dart
```

### Release

```shell script
flutter run --release --flavor development -t lib/main/main_development.dart
flutter run --release --flavor staging -t lib/main/main_staging.dart
flutter run --release --flavor production -t lib/main/main_production.dart
```
