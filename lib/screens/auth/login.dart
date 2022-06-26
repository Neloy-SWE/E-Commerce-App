import 'package:flutter/material.dart';
import 'package:my_ecommerce/utils/constants.dart';
import 'package:my_ecommerce/utils/strings.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: ListView(
        padding: Constants.paddingAll15,
        children: [
          Constants.gapH30,

          // login text
          Text(
            AllText.login,
            style: Theme.of(context).textTheme.headline3,
          ),
        ],
      ),
    );
  }
}
