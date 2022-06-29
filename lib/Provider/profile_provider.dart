import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:my_ecommerce/api/api_constant_data.dart';
import 'package:my_ecommerce/api/local_storage_manager.dart';
import '../model/profile_model.dart';

// product details

final profileProvider = Provider<GetProfile?>((ref) => GetProfile());
final profileFuture = FutureProvider.autoDispose<ProfileModel?>((ref) async {
  final repository = ref.watch(profileProvider);
  return repository!.callProfileApi();
});

class GetProfile {
  Future<ProfileModel?> callProfileApi() async {
    try {
      String userToken =
          await LocalStorageManager.readData(ApiConstant.userLoginToken);
      var headers = {ApiConstant.authorization: 'Bearer $userToken'};
      var request =
          http.Request('GET', Uri.parse('${ApiConstant.baseUrl}account'));
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return ProfileModel.fromJson(str);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
