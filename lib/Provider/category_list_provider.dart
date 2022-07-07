import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:my_ecommerce/api/api_constant_data.dart';
import 'package:my_ecommerce/model/category_list_model.dart';

// category list

final categoryListProvider =
    Provider<GetCategoryList?>((ref) => GetCategoryList());
final categoryListFuture = FutureProvider.autoDispose<CategoryListModel?>((ref) async {
  final repository = ref.watch(categoryListProvider);
  return repository!.callGetCategoryListApi();
});

class GetCategoryList {
  Future<CategoryListModel?> callGetCategoryListApi() async {
    try {
      var request =
          http.Request('GET', Uri.parse('${ApiConstant.baseUrl}category'));
      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return CategoryListModel.fromJson(str);
      } else {

        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
