import 'package:flutter/material.dart';
import 'package:my_ecommerce/utils/colors.dart';

import '../components/grid_view_fixed_height.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: ListView(
        padding: Constants.paddingAll15,
        children: [
          // simple banner
          Image.asset("assets/images/banner.png"),
          Constants.gapH15,

          // title of the page
          Text(
            AllText.productCategory,
            style: Theme.of(context).textTheme.headline3,
          ),
          Constants.gapH30,

          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const GridViewFixedHeight(
              crossAxisCount: 2,
              // childAspectRatio: 0.60,
              height: 210,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return _categoryCard();
            },
          ),
        ],
      ),
    );
  }

  Widget _categoryCard() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 210,
        decoration: const BoxDecoration(
          /* boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(0,0),
            ),
          ],*/
          color: AllColor.primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(7)),
        ),
        child: Column(
          children: [
            Container(
              height: 130,
              decoration: const BoxDecoration(
                color: AllColor.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://mir-s3-cdn-cf.behance.net/project_modules/1400/0eca0d45212463.5829baa38a4b3.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Name: Category 1 asdf as dfasdf",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                  Constants.gapH10,
                  Text(
                    "total product: 10",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
