import 'package:flutter/material.dart';
import 'package:my_ecommerce/components/all_input.dart';
import 'package:my_ecommerce/components/buttons/general_button.dart';
import 'package:my_ecommerce/screens/auth/signup.dart';
import 'package:my_ecommerce/utils/constants.dart';
import 'package:my_ecommerce/utils/strings.dart';

import '../../api/api_response.dart';
import '../../api/auth_api.dart';
import '../../components/custom_snackbar.dart';
import '../../utils/colors.dart';
import '../homepage.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final _formKeyLogIn = GlobalKey<FormState>();

  @override
  dispose() {
    _emailController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: ListView(
        padding: Constants.paddingAll15,
        children: [
          Image.asset(
            "assets/images/login.png",
            height: 200,
            width: double.infinity,
          ),

          // login text
          Text(
            AllText.login,
            style: Theme.of(context).textTheme.headline3,
          ),
          Constants.gapH50,

          //log in form
          Form(
            key: _formKeyLogIn,
            child: Column(
              children: [
                // text field: email
                AllInput.generaInput(
                  context: context,
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                  enterAction: TextInputAction.next,
                  prefixIcon: Icons.mark_email_read_outlined,
                  label: AllText.email,
                  hint: AllText.emailHint,
                  validatorFunction: (value) {
                    String pattern =
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                    RegExp regExp = RegExp(pattern);
                    if (value!.isEmpty) {
                      return "Field is required !!";
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid email';
                    }
                    return null;
                  },
                ),
                Constants.gapH15,

                // text field: password
                AllInput.generaInput(
                  context: context,
                  controller: _passController,
                  textInputType: TextInputType.visiblePassword,
                  enterAction: TextInputAction.done,
                  prefixIcon: Icons.password_rounded,
                  label: AllText.password,
                  hint: AllText.passHint,
                  secure: true,
                  validatorFunction: (value) {
                    if (value!.isEmpty) {
                      return "Field is required !!";
                    } else if (value.length < 6) {
                      return "password length is less than 6 !!";
                    }
                    return null;
                  },
                ),
                Constants.gapH10,
              ],
            ),
          ),

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
          Constants.gapH50,

          // sign up option
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AllText.newHere,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              GestureDetector(
                onTap: goToSignUp,
                child: Text(
                  AllText.signUp,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AllColor.primaryColor,
                        fontFamily: AllText.bold,
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void loginOnTap() {
    if (_formKeyLogIn.currentState!.validate()) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
      _logInApiCall(
        email: _emailController.text.trim(),
        password: _passController.text.trim(),
      );
    }
  }

  void goToSignUp() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (builder) => const SignUp()));
  }

  void _logInApiCall({String? email, String? password}) async {
    ApiResponseModel? response =
        await AuthApi().callLoginAPi(email: email, password: password);

    if (response.statusCode == 200) {
      CustomSnackBar(
              message: "Log in successful !!!", context: context, isSuccess: true)
          .show();
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (builder)=>const HomePage()));
    } else {
      CustomSnackBar(
              message: response.message, context: context, isSuccess: false)
          .show();
    }
  }
}
