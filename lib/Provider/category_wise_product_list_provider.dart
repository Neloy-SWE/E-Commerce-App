import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:my_ecommerce/api/api_constant_data.dart';
import 'package:my_ecommerce/model/category_wise_product_list_model.dart';

// category wise product list

final categoryWiseProductListProvider =
Provider<GetCategoryWiseProductList?>((ref) => GetCategoryWiseProductList());
final categoryWiseProductListFuture = FutureProvider.autoDispose
    .family<CategoryWiseProductListModel?, String>((ref, id) async {
  final repository = ref.watch(categoryWiseProductListProvider);
  return repository!.callGetCategoryWiseProductListApi(id: id);
});

class GetCategoryWiseProductList {
  Future<CategoryWiseProductListModel?> callGetCategoryWiseProductListApi(
      {required String id}) async {
    try {
      var request =
      http.Request('GET', Uri.parse('${ApiConstant.baseUrl}category/products/$id'));
      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return CategoryWiseProductListModel.fromJson(str);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
