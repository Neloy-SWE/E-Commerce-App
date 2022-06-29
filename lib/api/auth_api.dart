import 'dart:convert';
import 'package:my_ecommerce/utils/strings.dart';

import '../model/login_model.dart';
import 'api_constant_data.dart';
import 'api_response.dart';
import 'local_storage_manager.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  // log in api call
  Future<ApiResponseModel> callLoginAPI({
    String? email,
    String? password,
  }) async {
    try {
      var headers = {ApiConstant.contentType: ApiConstant.acceptValue};
      var request =
      http.Request('POST', Uri.parse('${ApiConstant.baseUrl}auth/login'));
      request.body = json.encode({
        "email": email,
        "password": password,
      });

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
        statusCode: 404,
        message: AllText.netError,
      );
    }
  }

  // sign up api call
  Future<ApiResponseModel> callRegistrationAPI({
    String? name,
    String? email,
    String? phone,
    String? password,
  }) async {
    try {
      var headers = {ApiConstant.contentType: ApiConstant.acceptValue};
      var request = http.Request(
          'POST', Uri.parse('${ApiConstant.baseUrl}auth/register'));
      request.body = json.encode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      });

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var str = await response.stream.bytesToString();
      if (response.statusCode == 201) {
        return ApiResponseModel(
            statusCode: response.statusCode,
            message: jsonDecode(str)["message"]);
      } else {
        return ApiResponseModel(
            statusCode: response.statusCode,
            message: "Email or phone not valid !");
      }
    } catch (e) {
      return ApiResponseModel(
        statusCode: 404,
        message: AllText.netError,
      );
    }
  }

  Future<ApiResponseModel> callLogoutAPI() async {
    try {
      String userToken =
      await LocalStorageManager.readData(ApiConstant.userLoginToken);
      var headers = {ApiConstant.authorization: 'Bearer $userToken'};
      var request =
      http.Request('POST', Uri.parse('${ApiConstant.baseUrl}auth/logout'));

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
            statusCode: response.statusCode, message: AllText.somethingWrong);
      }
    } catch (e) {
      //  print("Hello error Error: $e");
      return ApiResponseModel(
        statusCode: 404,
        message: AllText.netError,
      );
    }
  }
}
//save data at shared preference
sharedPreference(LoginModel user) {
  //print('Token: ${user.accessToken}');
  LocalStorageManager.saveData(ApiConstant.userLoginToken, user.accessToken);
}
