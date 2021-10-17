import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:userapp/constants/api.dart';
import "package:http/http.dart" as http;
import 'package:userapp/models/api_manager.dart';
import 'package:userapp/models/category.model.dart';

Future<List<ShopCategory>> fetchCategories() async {
  // final response = await http.get(Uri.parse("$apiUrl/category"), headers: <String, String>{"Content-type": "application/json; charset=UTF-8", "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MTQ0MjlhNmI4MWQyYjIxYWMzMzhmZDMiLCJpYXQiOjE2MzI5MjM3NTd9._Plg48ccHQW0OQAtWlezgMKvQ3Lq4PIgXaU8xf7OCtM"});
  final api = ApiManager();
  final response = api.getAPICall("$apiUrl/category");

  response.then((res) => print(res)).catchError((onError) => print(onError));

  // if (response.statusCode == 200) {
  //   return compute(parseCategories, jsonDecode(response.body)["results"]);
  // }
  return [];

  // throw Exception("Failed to load shop");
}
