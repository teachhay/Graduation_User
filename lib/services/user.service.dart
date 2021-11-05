import 'dart:convert';

import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';
// ignore: unused_import
import 'package:userapp/models/user.model.dart';

//FIXME change parameter to User class
Future<dynamic> updateUserInfo({required dynamic user}) async {
  try {
    ApiManager apiManager = ApiManager();
    PostResponse response = await apiManager.putApiCall("user", user);

    print(response.meta);

    if (response.meta == 200) {
      return response;
    }

    return null;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}
