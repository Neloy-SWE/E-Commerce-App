import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_ecommerce/Provider/category_list_provider.dart';
import 'package:my_ecommerce/utils/colors.dart';
import '../Provider/category_wise_product_list_provider.dart';
import '../components/custom_circular_progressbar.dart';
import '../components/data_not_found.dart';
import '../components/grid_view_fixed_height.dart';
import '../model/category_list_model.dart';
import '../utils/constants.dart';
import '../utils/strings.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int totalCategory = 0;
  int length = 0;

  Future<void> _refreshCategory() async {
    ref.refresh(categoryListProvider);
  }

  @override
  void initState() {
    ref.read(
      categoryListFuture(
        context,
      ),
    );
    super.initState();

    ref.read(
      categoryWiseProductListFuture(
        0.toString(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categoryValue = ref.watch(
      categoryListFuture(
        context,
      ),
    );
    if (categoryValue.value != null &&
        categoryValue.value!.categoryListData != null) {
      totalCategory = categoryValue.value!.categoryListData!.isEmpty
          ? 0
          : categoryValue.value!.categoryListData!.length;
    }
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: RefreshIndicator(
        onRefresh: _refreshCategory,
        child: ListView(
          padding: Constants.paddingAll15,
          children: [
            // simple banner
            Image.asset("assets/images/banner.png"),
            Constants.gapH15,

            // title of the page
            Text(
              AllText.productCategory,
              style: Theme
                  .of(context)
                  .textTheme
                  .headline3,
            ),
            Constants.gapH30,

            categoryValue.when(
                data: (data) =>
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
                      itemCount: data!.categoryListData!.length,
                      itemBuilder: (context, index) {
                        return _categoryCard(
                            data: data.categoryListData![index]);
                      },
                    ),
                error: (err, stack) =>
                    DataNotFoundPage(
                      massage: err.toString(),
                    ),
                loading: () => const Center(child: CustomCircularProgress())),
          ],
        ),
      ),
    );
  }

  Widget _categoryCard({required CategoryListData data}) {
    final lengthValue = ref.watch(
        categoryWiseProductListFuture(data.id.toString()));
    if (lengthValue.value?.categoryWiseProductListData != null &&
        lengthValue.value != null) {
      length =
      lengthValue.value!.categoryWiseProductListData!.isEmpty ? 0 : lengthValue
          .value!.categoryWiseProductListData!.length;
    }
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
                    "Name: ${data.name}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                  Constants.gapH10,
                  Text(
                    "total product: $length",
                    textAlign: TextAlign.center,
                    style: Theme
                        .of(context)
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
