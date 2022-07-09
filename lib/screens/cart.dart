import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_ecommerce/utils/constants.dart';

import '../components/custom_drawer.dart';
import '../utils/colors.dart';
import '../utils/strings.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String imgLink =
      "https://mir-s3-cdn-cf.behance.net/project_modules/1400/0eca0d45212463.5829baa38a4b3.jpg";

  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
        title: const Text(AllText.cart),
      ),
      body: ListView(
        padding: Constants.paddingAll15,
        children: [
          Image.asset(
            "assets/images/cart.png",
            height: 200,
            width: double.infinity,
          ),
          Text(
            AllText.items,
            style: Theme.of(context).textTheme.headline3,
          ),
          Constants.gapH30,

          // items
          Container(
            padding: Constants.paddingAll15,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 5,
                  blurStyle: BlurStyle.outer,
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // product image
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: AllColor.primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                          imgLink,
                        ),
                        fit: BoxFit.fill),
                  ),
                ),
                Constants.gapW10,

                // details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Product Name",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontSize: 20,
                          ),
                    ),
                    Text(
                      "BDT 200 /-",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 12,
                          ),
                    ),
                  ],
                ),
                Constants.gapW10,

                //
                Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(7),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: (){
                          setState((){
                            if (count>0){
                              count--;
                            }
                          });
                        },
                        child: Text(
                          "-",
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        "$count",
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          setState((){
                              count++;
                          });
                        },
                        child: Text(
                          "+",
                          style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
