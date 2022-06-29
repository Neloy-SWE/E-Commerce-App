import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ecommerce/components/all_button.dart';
import 'package:my_ecommerce/utils/colors.dart';
import 'package:my_ecommerce/utils/strings.dart';

import '../../Provider/product_details_provider.dart';
import '../../components/action_icon.dart';
import '../../components/custom_drawer.dart';
import '../../utils/constants.dart';

class ProductDetails extends ConsumerStatefulWidget {
  final String productId;

  const ProductDetails({
    Key? key,
    required this.productId,
  }) : super(key: key);

  @override
  ConsumerState<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails> {
  String imgLink =
      "https://mir-s3-cdn-cf.behance.net/project_modules/1400/0eca0d45212463.5829baa38a4b3.jpg";

  String name = "";
  String price = "";
  int stock = 0;

  Future<void> _refreshProductDetails() async {
    ref.refresh(productDetailsProvider);
  }

  @override
  void initState() {
    ref.read(
      productDetailsFuture(
        widget.productId,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productDetailsValue = ref.watch(
      productDetailsFuture(widget.productId),
    );
    if (productDetailsValue.value != null &&
        productDetailsValue.value?.productDetailsData != null) {
      name = productDetailsValue.value!.productDetailsData!.name!.isNotEmpty
          ? productDetailsValue.value!.productDetailsData!.name!
          : "N/A";

      price = productDetailsValue.value!.productDetailsData!.price!.isNotEmpty
          ? productDetailsValue.value!.productDetailsData!.price!
          : "N/A";

      stock = productDetailsValue.value!.productDetailsData!.enableStock!;
    }
    return Scaffold(
      endDrawer: const CustomDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Constants.gapW150,
            ActionIcon.customIcon(
                onTap: () {},
                icon: Icons.shopping_bag_outlined,
                count: "9+",
                context: context),
          ],
        ),

        elevation: 5,
        shadowColor: AllColor.shadowColor,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshProductDetails,
        child: ListView(
          padding: Constants.paddingAll15,
          children: [
            // product image
            Image.network(
              imgLink,
              height: 400,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Constants.gapH15,

            // product name
            Text(
              name,
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    fontSize: 30,
                  ),
            ),
            Constants.gapH10,

            // product price
            Text(
              "BDT $price /-",
              style: Theme.of(context).textTheme.headline5,
            ),
            Constants.gapH10,

            // available product
            Text(
              "Available product: $stock",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Constants.gapH30,

            AllButton.generalButton(
              context: context,
              btnText: AllText.addToCartCap,
              onTap: _addToCart,
            ),
          ],
        ),
      ),
    );
  }

  void _addToCart() {}
}
