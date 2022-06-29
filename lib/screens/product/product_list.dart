import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ecommerce/model/category_wise_product_list_model.dart';
import 'package:my_ecommerce/screens/product/product_details.dart';
import 'package:my_ecommerce/utils/colors.dart';
import 'package:my_ecommerce/utils/strings.dart';

import '../../Provider/category_wise_product_list_provider.dart';
import '../../components/custom_circular_progressbar.dart';
import '../../components/custom_drawer.dart';
import '../../components/data_not_found.dart';
import '../../utils/constants.dart';

class ProductList extends ConsumerStatefulWidget {
  final String categoryId;
  final String categoryName;
  final int totalProduct;

  const ProductList({
    Key? key,
    required this.categoryId,
    required this.categoryName,
    required this.totalProduct,
  }) : super(key: key);

  @override
  ConsumerState<ProductList> createState() => _ProductListState();
}

class _ProductListState extends ConsumerState<ProductList> {
  String imgLink =
      "https://mir-s3-cdn-cf.behance.net/project_modules/1400/0eca0d45212463.5829baa38a4b3.jpg";

  Future<void> _refreshProductDetails() async {
    ref.refresh(categoryWiseProductListProvider);
  }

  @override
  void initState() {
    ref.read(
      categoryWiseProductListFuture(
        widget.categoryId,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productListValue = ref.watch(
      categoryWiseProductListFuture(
        widget.categoryId,
      ),
    );

    return Scaffold(
      endDrawer: const CustomDrawer(),

      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: const Icon(CupertinoIcons.left_chevron),
        ),
        title: Text(widget.categoryName),
      ),
      body: widget.totalProduct == 0
          // if available product is 0
          ? RefreshIndicator(
              onRefresh: _refreshProductDetails,
              child: ListView(
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 0.5) - 200,
                  ),
                  Image.asset(
                    "assets/images/na.png",
                    height: 200,
                    width: double.infinity,
                  ),
                  Text(
                    AllText.noAvailableProduct,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            )
          : RefreshIndicator(
              onRefresh: _refreshProductDetails,
              child: ListView(
                padding: Constants.paddingAll15,
                children: [
                  Image.asset(
                    "assets/images/product.png",
                    height: 200,
                    width: double.infinity,
                  ),

                  // total available product:
                  Text(
                    AllText.totalAvailableProduct +
                        widget.totalProduct.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Constants.gapH15,

                  productListValue.when(
                      data: (data) => ListView.builder(
                            reverse: true,
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                data!.categoryWiseProductListData!.length,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return _singleProduct(
                                data: data.categoryWiseProductListData![index],
                              );
                            },
                          ),
                      error: (err, stack) => DataNotFoundPage(
                            massage: err.toString(),
                          ),
                      loading: () =>
                          const Center(child: CustomCircularProgress())),

                  // product list:
                ],
              ),
            ),
    );
  }

  Widget _singleProduct({
    required CategoryWiseProductListData data,
  }) {
    if (data.imageUrl != null || data.imageUrl == "null") {
      setState(() {
        imgLink = data.imageUrl!;
      });
    }
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (builder) => ProductDetails(
                  productId: data.id.toString(),
                ),
              ),
            );
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    "BDT ${data.price!} /-",
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontSize: 12,
                        ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black,
        ),
      ],
    );
  }
}
