import 'package:flutter/material.dart';

class Constants {
  static const jaLanguageJa = 'ja';
  static const viLanguageCode = 'vi';
  static const enLanguageCode = 'en';

  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState> snackbarKey =
      GlobalKey<ScaffoldMessengerState>();

  static const signUpWithFacebook = 'Sign up with Facebook';
  static const signInWithFacebook = 'Sign in with Facebook';
  static const signUpWithApple = 'Sign up with Apple';
  static const signInWithApple = 'Sign in with Apple';
  static const signUpWithEmail = 'Sign up with Email';
  static const signInWithEmail = 'Sign in with Email';
  static const signUpWithGoogle = 'Sign up with Google';
  static const signInWithGoogle = 'Sign in with Google';
  static const counterExample = 'Counter example';
  static const getNumberNum = 'Get random num: ';
  static const getRandom = 'Get Random';
  static const rebuildWhenStateChange = 'Rebuild when state change: ';
  static const notRebuild = 'NOT rebuild: ';
  static const postList = 'Post List';
  static const listPost = 'List Post';
  static const name = 'Name';
  static const logOut = 'Logout';
  static const signIn = 'Sign in.';
  static const loginFailed = 'Login Failed';
  static const loginSuccessful = 'Login Successful';
  static const medium = 'Flutter Base Code';
  static const or = 'Or';
  static const base = 'Base';
  static const qrScanner = 'QR Scanner';
  static const termsOfService = 'Privacy - Terms of Service';
  static const byCreatingAnAccountAcceptMedium =
      'By creating an account. I accept Medium\'s';
  static const alreadyHaveAnAccount = 'Already have an account? ';
  static const notAccount = "Don't have an account? ";
  static const flutterBSD = 'Flutter BSD';
  static const smartStoriesForCuriousPeople =
      'Smart stories for \n curious people.';
  static const error = 'Error';
  static const retry = 'Retry';
  static const email = 'Email';
  static const password = 'Password';
  static const rePassword = 'Re Password';
  static const signUp = 'Sign Up';
  static const signInUp = 'Sign In';
  static const updatePhoneNumber = 'Update phone number';
  static const phone = 'Phone';
  static const code = 'Code';
  static const getCode = 'Get code';
  static const updatePhoneNumberFailed = 'Update phone number failed';
  static const updatePhoneNumberSuccessful = 'Update phone number successful';
  static const sessionExpired = 'Session expired, push to login';
  static const updatePasswordForYourAccount =
      'Update password for your account';
  static const updatePassword = 'Update Password';
  static const reEnterPassword = 'Re-enter wrong password';
  static const reLoginToUpdate = 'Re login to update';
  static const updatePasswordSuccess = 'Update password success';
  static const forgotPassword = 'Forgot Password';
  static const findPassword = 'Find Password';
  static const findPasswordSuccess =
      'Password reset link has been sent to your email, please check your email';
  static const emailToFindYourPassword =
      'Enter your email to find your password';

  // int
  static const otherFieldMaxLength100 = 100;
  static const onVerifiedSuccessfully = "You've been verified successfully.";
  static const onVerifiedError = 'Failed to verify.';
  static const charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
  static const apiKey = '6LdO8n8fAAAAAAFW6EMmqQ1YNz55dbyGoDX5tSWo';
  static const apiSecret = '6LdO8n8fAAAAADx7b0yuhsZypI2wF1QHEOvaBaql';
  static const pluginURL = 'https://recaptcha-flutter-plugin.firebaseapp.com/';
  static const cancelCaptcha = 'CANCEL CAPTCHA';
  static const siteverify = 'https://www.google.com/recaptcha/api/siteverify';
}

class Asset {
  // image png
  static const googleImage = 'assets/images/google_image.png';

  // image svg
  static const appleLogo = 'assets/svg/apple_logo.svg';
  static const fbLogo = 'assets/svg/fb_logo.svg';
  static const gmailLogo = 'assets/svg/gmail_logo.svg';
  static const googleLogo = 'assets/svg/google_logo.svg';
  static const qrLogo = 'assets/svg/qr_code.svg';

  // image network
  static const imageDefault = 'https://picsum.photos/250?image=9';
}

// TODO(tupa1): remove this class -> use app styles and theme
class ColorApp {
  // green
  static const green0 = Color(0xFFAFCEB3);

  // black
  static const black0 = Colors.black;

  // red
  static const red0 = Colors.red;
}
