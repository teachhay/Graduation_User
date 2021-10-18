import 'package:flutter/foundation.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/api_manager.dart';
import 'package:userapp/models/sell_company.model.dart';

Future<List<SellCompany>> fetchShops() async {
  final api = ApiManager();
  final response = await api.getsApiCall("$apiUrl/shop");

  return compute(parseShops, response["results"]);
}
