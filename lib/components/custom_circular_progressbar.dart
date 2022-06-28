import 'package:flutter/material.dart';
import 'package:my_ecommerce/utils/colors.dart';

class CustomCircularProgress extends StatelessWidget {
  const CustomCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Padding(
        padding: EdgeInsets.all(10),
        child: CircularProgressIndicator(
          color: AllColor.primaryColor,
        ),
      ),
    );
  }
}
