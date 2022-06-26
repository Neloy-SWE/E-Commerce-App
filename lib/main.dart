import 'package:flutter/material.dart';
import 'package:my_ecommerce/screens/splash_screen.dart';
import 'package:my_ecommerce/utils/strings.dart';

import 'components/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: AllText.title,
        theme: AppTheme.lightTheme,
        home: const SplashScreen(),
      ),
    );
  }
}
