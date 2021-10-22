import 'package:flutter/foundation.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/api_manager.dart';
import 'package:userapp/models/sell_company.model.dart';

Future<List<SellCompany>> fetchShops({dynamic query}) async {
  final api = ApiManager();
  final dynamic response;

  if (query != null) {
    response = await api.getsApiCall("/shop", params: query);
  } else {
    response = await api.getsApiCall("/shop");
  }

  return compute(parseShops, response["results"]);
}

Future<List<SellCompany>> fetchShopsByCategory() async {
  final api = ApiManager();
  final response = await api.getsApiCall("$apiUrl/shop");

  return compute(parseShops, response["results"]);
}
