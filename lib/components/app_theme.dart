import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ecommerce/utils/strings.dart';
import '../utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,

    // app bar
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: AllColor.primaryColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),

    // text theme
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontFamily: AllText.bold,
        fontSize: 50,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontFamily: AllText.bold,
        fontSize: 30,
        color: AllColor.primaryColor,
      ),
      headline3: TextStyle(
        fontFamily: AllText.bold,
        fontSize: 40,
        color: Colors.black,
      ),
      headline4: TextStyle(
        fontFamily: AllText.bold,
        fontSize: 10,
        color: AllColor.errorColor,
      ),
      bodyText1: TextStyle(
        fontFamily: AllText.regular,
        fontSize: 15,
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        fontFamily: AllText.regular,
        fontSize: 11,
        color: Colors.black,
      ),
      headline5: TextStyle(
        fontFamily: AllText.bold,
        fontSize: 15,
        color: AllColor.primaryColor,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AllColor.primaryColor),
  );
}
