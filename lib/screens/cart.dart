import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/custom_drawer.dart';
import '../utils/strings.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
        title: const Text(AllText.cart),
      ),
    );
  }
}
