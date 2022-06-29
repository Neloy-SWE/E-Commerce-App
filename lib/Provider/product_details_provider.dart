import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:my_ecommerce/api/api_constant_data.dart';
import '../model/product_details_model.dart';

// product details

final productDetailsProvider =
Provider<GetProductDetails?>((ref) => GetProductDetails());
final productDetailsFuture = FutureProvider.autoDispose
    .family<ProductDetailsModel?, String>((ref, id) async {
  final repository = ref.watch(productDetailsProvider);
  return repository!.callGetCategoryListApi(id: id);
});

class GetProductDetails {
  Future<ProductDetailsModel?> callGetCategoryListApi({
  required String id,
}) async {
    try {
      var request =
      http.Request('GET', Uri.parse('${ApiConstant.baseUrl}product/$id'));
      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return ProductDetailsModel.fromJson(str);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
