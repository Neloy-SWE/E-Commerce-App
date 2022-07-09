import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_ecommerce/components/all_button.dart';
import 'package:my_ecommerce/screens/auth/login.dart';
import 'package:my_ecommerce/utils/colors.dart';
import 'package:my_ecommerce/utils/constants.dart';
import 'package:my_ecommerce/utils/strings.dart';
import '../Provider/profile_provider.dart';
import '../api/api_response.dart';
import '../api/auth_api.dart';
import '../components/customDivider.dart';
import '../components/custom_snackbar.dart';

class ProfileSection extends ConsumerStatefulWidget {
  const ProfileSection({Key? key}) : super(key: key);

  @override
  ConsumerState<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends ConsumerState<ProfileSection> {
  String myName = "Test Name";
  String email = "test@gmail.com";
  String phone = "01766559988";

  Future<void> _refreshProfile() async {
    ref.refresh(profileProvider);
  }

  File? profilePicture;
  String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgYnTGVf5H3HjCrxlR8YyNQfWkFi3pEab7XQ&usqp=CAU";

  Future _picImageGallery() async {
    try {
      final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image1 == null) return;
      final imageTem = File(image1.path);
      setState(() {
        this.profilePicture = imageTem;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Future _picImageCamera() async {
    try {
      final image1 = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image1 == null) return;
      final imageTem = File(image1.path);
      setState(() {
        this.profilePicture = imageTem;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  void initState() {
    ref.read(
      profileFuture,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final profileValue = ref.watch(profileFuture);

/*    if (profileValue.value != null) {
      myName = profileValue.value!.name!;
      email = profileValue.value!.email!;
      phone = profileValue.value!.phone!;
    }*/
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
      ),
      body: RefreshIndicator(
        color: AllColor.primaryColor,
        onRefresh: _refreshProfile,
        child: ListView(
          padding: Constants.paddingAll15,
          children: [
            Row(
              children: [
                // profile picture
                profilePicture != null
                    ? CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Image.file(
                          profilePicture!,
                          fit: BoxFit.contain,
                        ),
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                            image: NetworkImage(
                              image,
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                Constants.gapW10,

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // name
                    Text(
                      myName,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                            fontSize: 30,
                          ),
                    ),
                    Constants.gapH10,

                    // email
                    Text(
                      email,
                      style: Theme.of(context).textTheme.headline5,
                    ),

                    // phone
                    Text(
                      phone,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.black,
            ),
            Constants.gapH100,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AllButton.generalButton(
                    onTap: () {
                      _logOutApiCall();
                    },
                    context: context,
                    btnText: AllText.logoutCap,
                  ),
                ),
                Constants.gapW10,
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (builder) => SizedBox(
                          height: 200,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    _picImageGallery();
                                  },
                                  child: Text(
                                    AllText.gallery,
                                    style: Theme.of(context).textTheme.headline5,
                                  ),

                                ),
                                CustomDivider.myDivider(),

                                TextButton(
                                  onPressed: () {
                                    _picImageCamera();
                                  },
                                  child: Text(
                                    AllText.camera,
                                    style: Theme.of(context).textTheme.headline5,
                                  ),

                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(7),
                          ),
                          border: Border.all(
                            color: AllColor.primaryColor,
                            width: 1,
                          )),
                      alignment: Alignment.center,
                      child: Text(
                        AllText.edit,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _logOutApiCall() async {
    ApiResponseModel? response =
    await AuthApi().callLogoutAPI();

    if (response.statusCode == 200) {
      CustomSnackBar(
          message: response.message,
          context: context,
          isSuccess: true)
          .show();
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (builder) => const LogIn()));
    } else {
      CustomSnackBar(
          message: response.message, context: context, isSuccess: false)
          .show();
    }
  }
}
