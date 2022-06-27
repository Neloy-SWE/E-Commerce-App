import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/all_input.dart';
import 'package:my_ecommerce/components/buttons/general_button.dart';
import 'package:my_ecommerce/utils/constants.dart';
import 'package:my_ecommerce/utils/strings.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  int a = 0;

  @override
  dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  initSate() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: Constants.paddingAll15,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // login text
            Text(
              AllText.login,
              style: Theme.of(context).textTheme.headline3,
            ),
            Constants.gapH50,

            // text field: email
            AllInput.generaInput(
              context: context,
              controller: _emailController,
              textInputType: TextInputType.emailAddress,
              enterAction: TextInputAction.next,
              prefixIcon: Icons.mark_email_read_outlined,
              label: AllText.email,
              hint: AllText.emailHint,
            ),
            Constants.gapH15,

            // text field: password
            AllInput.generaInput(
              context: context,
              controller: _passController,
              textInputType: TextInputType.visiblePassword,
              enterAction: TextInputAction.go,
              prefixIcon: Icons.password_rounded,
              label: AllText.password,
              hint: AllText.passHint,
              secure: true,
            ),
            Constants.gapH10,

            // forget password
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  AllText.forgetPass,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
            Constants.gapH10,

            // login button
            AllButton.generalButton(
              context: context,
              btnText: AllText.loginCap,
              onTap: loginOnTap,
            ),
          ],
        ),
      ),
    );
  }

  void loginOnTap() {
    setState(() {});
  }
}
