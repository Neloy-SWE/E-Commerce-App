import 'package:flutter/material.dart';
import 'package:my_ecommerce/utils/colors.dart';

class ActionIcon {
  static customIcon(
      {required Function onTap,
        required IconData icon,
        required String count,
        required BuildContext context}) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Icon(
              icon,
              color: Colors.black,
              size: 22,
            ),
            Positioned(
              bottom: -2,
              left: -8,
              child: Container(
                height: 15,
                width: 20,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: AllColor.primaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Text(count , style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  color: Colors.white,
                )
                ),),
              ),
          ],
        ),
      ),
    );
  }
}