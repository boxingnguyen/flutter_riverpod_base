// Declare common constant style such as color, text style, dimension
import 'package:flutter/material.dart';

class AppStyles {
  AppStyles._();

  // color
  static const primaryColor = Color(0xff68A596);
  static final secondaryColor = Colors.grey[700];
  static const bgDarkModeColor = Colors.black;
  static const bgLightModeColor = Color(0xffF6F6F6);
  static const iconDarkModeColor = Color(0xffF6F6F6);
  static const iconLightModeColor = Colors.black;

  static const errorColor = Color(0xffED5B5B);
  static const inActiveColor = Color(0xffD1D1D1);
  static const cardLightModeColor = Color(0xFFE0E0E0);
  static const cardDarkModeColor = Color(0xFF171717);
  static const shadowLightModeColor = Color(0xFF757575);
  static const shadowDarkModeColor = Colors.black;

  // font size
  static const double fontSizeS = 11;
  static const double fontSizeM = 13;
  static const double fontSizeL = 15;
  static const double fontSizeH = 20;

  // icon size
  static const double iconSizeS = 18;
  static const double iconSizeM = 24;
  static const double iconSizeL = 36;
  static const double iconSizeH = 42;

  // button size
  static const double buttonRadiusS = 10;
  static const double buttonRadiusM = 15;
  static const double buttonRadiusL = 30;
  static const double buttonBottomHeight = 50;

  // dimension
  static const double horizontalSpace = 20;
  static const double verticalSpace = 20;
  static const double gridViewSpace = 15;
  static const double listItemSpace = 8;
  static const double imageRatio = 335 / 182;

  // text style
  static const TextStyle textRegular = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: fontSizeS,
  );

  static final TextStyle textMedium = textRegular.copyWith(
    fontWeight: FontWeight.w500,
  );

  static final TextStyle textBold = textRegular.copyWith(
    fontWeight: FontWeight.w700,
  );
}
