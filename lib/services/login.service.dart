import 'dart:convert';

import 'package:userapp/models/request.dart';
import 'package:userapp/models/response.model.dart';

Future<dynamic> login(String email, String password) async {
  try {
    //FIXME replace with params data
    Map<String, String> data = {
      "email": "user@gmail.com",
      "password": "admin1233",
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
