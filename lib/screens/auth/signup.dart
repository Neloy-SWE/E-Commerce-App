import 'package:flutter/material.dart';

import '../../components/all_input.dart';
import '../../components/buttons/general_button.dart';
import '../../utils/colors.dart';
import '../../utils/constants.dart';
import '../../utils/strings.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  final _formKeySignUp = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: ListView(
        padding: Constants.paddingAll15,
        children: [
          Image.asset(
            "assets/images/signup.png",
            height: 200,
            width: double.infinity,
          ),

          // sign up text
          Text(
            AllText.signUp,
            style: Theme.of(context).textTheme.headline3,
          ),
          Constants.gapH50,

          // sign up form
          Form(
            key: _formKeySignUp,
            child: Column(
              children: [
                // text field: name
                AllInput.generaInput(
                  context: context,
                  controller: _nameController,
                  textInputType: TextInputType.text,
                  enterAction: TextInputAction.next,
                  prefixIcon: Icons.person_add_alt,
                  label: AllText.name,
                  hint: AllText.nameHint,
                  validatorFunction: (value) {
                    String pattern = r"[^a-z^A-Z^0-9]+";
                    RegExp regExp = RegExp(pattern);
                    if (value!.isEmpty) {
                      return "Field is required !!";
                    } else if (!regExp.hasMatch(value)) {
                      return null;
                    } else {
                      return "Avoid Special characters";
                    }
                  },
                ),
                Constants.gapH15,

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

                // text field: phone
                AllInput.generaInput(
                  context: context,
                  controller: _phoneController,
                  textInputType: TextInputType.phone,
                  enterAction: TextInputAction.next,
                  prefixIcon: Icons.contact_phone_outlined,
                  label: AllText.phone,
                  hint: AllText.phoneHint,
                  validatorFunction: (value) {
                    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = RegExp(pattern);
                    if (value!.isEmpty) {
                      return "Field is required !!";
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid mobile number';
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
                Constants.gapH30,
              ],
            ),
          ),

          // sign up button
          AllButton.generalButton(
            context: context,
            btnText: AllText.signUpCap,
            onTap: signUpOnTap,
          ),
          Constants.gapH50,

          // login option
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AllText.alreadyHaveAcc,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              GestureDetector(
                onTap: goToLogIn,
                child: Text(
                  AllText.login,
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

  void signUpOnTap() {
    if (_formKeySignUp.currentState!.validate()) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }
  }

  void goToLogIn() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (builder) => const LogIn()));
  }
}
