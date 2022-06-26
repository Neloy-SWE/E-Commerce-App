import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class AllInput {
  static generaInput({
    bool secure = false,
    required BuildContext context,
    IconData? prefixIcon,
    final String? Function(String?)? validatorFunction,
    String hint = "",
    String label = "",
    IconData? suffixIcon,
    Widget? suffixWidget,
    required TextEditingController controller,
    required TextInputType textInputType,
    required TextInputAction enterAction,
    Color fillColor = MyColor.primaryColor,
    Function? callbackFunction,
  }) {
    return TextFormField(
      validator: validatorFunction,
      style: Theme.of(context).textTheme.headline4,
      obscureText: secure,
      controller: controller,
      keyboardType: textInputType,
      cursorColor: MyColor.primaryColor,
      textInputAction: enterAction,
      onChanged: (value) {
        if (callbackFunction != null) {
          callbackFunction(value);
        }
      },
      decoration: InputDecoration(
        errorStyle: Theme.of(context).textTheme.headline4,
        contentPadding: const EdgeInsets.all(10),
        alignLabelWithHint: true,
        prefixIcon: Icon(
          prefixIcon,
          color: MyColor.primaryColor,
        ),
        suffixIcon: Icon(
          suffixIcon,
          color: MyColor.primaryColor,
        ),
        suffix: suffixWidget,
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: MyColor.primaryColor),
          borderRadius: BorderRadius.circular(7),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: MyColor.errorColor),
          borderRadius: BorderRadius.circular(7),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 0.5, color: Colors.black),
          borderRadius: BorderRadius.circular(7),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: Colors.black54),
          borderRadius: BorderRadius.circular(7),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 1, color: MyColor.errorColor),
          borderRadius: BorderRadius.circular(7),
        ),
        fillColor: fillColor,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
              color: Colors.black54,
            ),
        labelText: label,
        labelStyle: Theme.of(context).textTheme.headline4!.copyWith(
              color: MyColor.primaryColor,
              fontSize: 9,
            ),
      ),
    );
  }
}