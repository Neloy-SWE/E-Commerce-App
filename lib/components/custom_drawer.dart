import 'package:flutter/material.dart';
import 'package:my_ecommerce/screens/profile_section.dart';
import 'package:my_ecommerce/utils/colors.dart';
import 'package:my_ecommerce/utils/constants.dart';
import 'package:my_ecommerce/utils/strings.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: Constants.paddingAll15,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Constants.gapH50,
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (builder) => const ProfileSection(),
                ),
              );
            },
            child: Row(
              children: [
                const Icon(
                  Icons.person_pin_outlined,
                  size: 35,
                  color: Colors.black,
                ),
                Constants.gapW10,
                Text(
                  AllText.myProfile,
                  style: Theme.of(context).textTheme.headline5,
                ),
                Constants.gapW10,
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 25,
                  color: AllColor.primaryColor,
                ),

              ],
            ),
          ),
          const Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
