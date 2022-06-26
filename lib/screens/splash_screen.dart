import 'package:flutter/material.dart';
import 'package:my_ecommerce/utils/constants.dart';
import 'package:my_ecommerce/utils/strings.dart';
import '../utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: Constants.paddingAll15,
        children: [
          // welcome image
          Image.asset(
            "assets/images/splash.png",
            height: 200,
            width: double.infinity,
          ),
          Constants.gapH50,

          // welcome text
          Text(
            AllText.welcome,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            AllText.splash1,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline2,
          ),
          Constants.gapH30,

          // loader
          const Align(
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                MyColor.primaryColor,
              ),
              strokeWidth: 5,
            ),
          ),
          Constants.gapH100,

          // subtitle
          Text(
            AllText.splashSubTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText1,
          ),

          Text(
            AllText.copyrightLeads,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),

        ],
      ),
    );
  }
}
