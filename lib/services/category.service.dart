import 'package:flutter/foundation.dart';
import 'package:userapp/models/request.dart';
import 'package:userapp/models/category.model.dart';

Future<List<ShopCategory>> fetchCategories() async {
  final api = ApiManager();
  final response = await api.getsApiCall("category");

  return compute(parseCategories, response["results"]);
}
