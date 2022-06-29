import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_ecommerce/utils/strings.dart';
import '../utils/colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,

    // app bar
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      elevation: 0,
      color: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: AllText.bold,
        fontSize: 25,
        color: Colors.black,
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
      headline6: TextStyle(
        fontFamily: AllText.bold,
        fontSize: 15,
        color: Colors.black,
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AllColor.primaryColor),
  );
}
