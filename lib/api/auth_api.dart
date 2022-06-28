import 'dart:convert';

import '../model/login_model.dart';
import 'api_constant_data.dart';
import 'api_response.dart';
import 'local_storage_manager.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  Future<ApiResponseModel> callLoginAPi(
      {String? email, String? password}) async {
    try {
      var headers = {ApiConstant.contentType: ApiConstant.acceptValue};
      var request =
          http.Request('POST', Uri.parse('${ApiConstant.baseUrl}auth/login'));
      request.body = json.encode({"email": email, "password": password});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      if (response.statusCode == 200) {
        sharedPreference(LoginModel.fromJson(str));

        return ApiResponseModel(
            statusCode: response.statusCode,
            message: jsonDecode(str)["message"]);
      } else {
        return ApiResponseModel(
            statusCode: response.statusCode, message: jsonDecode(str)["error"]);
      }
    } catch (e) {
      //  print("Hello error Error: $e");
      return ApiResponseModel(
          statusCode: 404, message: "Something Went Wrong !");
    }
  }
}

//save data at shared preference
sharedPreference(LoginModel user) {
  //print('Token: ${user.accessToken}');
  LocalStorageManager.saveData(ApiConstant.userLoginToken, user.accessToken);
}
