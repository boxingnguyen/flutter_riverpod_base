# Base project for flutter

# run to generated code with buiild_runner and freezed
- You setup build environment for the first time.
- You modified any code with the annotation `@freezed`.

```
flutter pub run build_runner build --delete-conflicting-outputs
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