import 'dart:convert';

import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';

Future<dynamic> login(String email, String password) async {
  try {
    Map<String, String> data = {
      "email": email,
      "password": password,
    };
    AuthRequest auth = AuthRequest();
    LoginResponse response = LoginResponse.fromJson(await auth.postApiCall("userlogin", data));

    if (response.meta == 200) {
      return response;
    }

    return false;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}

Future<dynamic> fetchUserInfo() async {
  try {
    AuthRequest auth = AuthRequest();
    UserInfoResponse response = UserInfoResponse.fromJson(await auth.getApiCall("info"));

    if (response.meta == 200) {
      return response;
    }

    return null;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}
