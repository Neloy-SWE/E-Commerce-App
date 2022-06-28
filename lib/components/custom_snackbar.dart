import 'package:flutter/material.dart';
import 'package:my_ecommerce/utils/strings.dart';

import '../utils/colors.dart';

class CustomSnackBar {
  final BuildContext? context;
  final String? message;
  final bool? isSuccess;

  CustomSnackBar({
    this.context,
    this.message,
    this.isSuccess,
  });

  show() {
    ScaffoldMessenger.of(context!)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(
        duration: const Duration(seconds: 30),
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context!).size.height * 0.85),
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            isSuccess! ? AllColor.primaryColor : AllColor.errorColor,
        content: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSuccess! ? AllColor.primaryColor : AllColor.errorColor,
              ),
              child: Icon(
                isSuccess! ? Icons.check : Icons.cancel,
                size: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            FittedBox(
                child: Text(message != null ? message! : "Something Went Wrong",
                    style: Theme.of(context!).textTheme.bodyText2!.copyWith(
                          fontFamily: AllText.bold,
                          color: Colors.white,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis)),
          ],
        ),
      ));
  }
}
