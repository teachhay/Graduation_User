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
    LoginResponse response = await auth.postApiCall("userlogin", data);

    if (response.meta == 200) {
      return response;
    }

    return false;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}
