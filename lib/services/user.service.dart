// ignore_for_file: unused_import, print

import 'dart:convert';

import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/models/user.model.dart';
import 'package:userapp/constants/api.dart';
import 'package:http/http.dart' as http;

//FIXME change parameter to User class
Future<dynamic> updateUserInfo({required dynamic user}) async {
  try {
    ApiManager apiManager = ApiManager();
    PostResponse response = await apiManager.postApiCall("test", user);

    if (response.meta == 200) {
      return response;
    }

    return null;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}
