import 'package:flutter/foundation.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/api_manager.dart';
import 'package:userapp/models/category.model.dart';

Future<List<ShopCategory>> fetchCategories() async {
  final api = ApiManager();
  final response = await api.getsApiCall("$apiUrl/category");

  return compute(parseCategories, response["results"]);
}
