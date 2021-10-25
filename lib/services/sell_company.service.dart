import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/models/sell_company.model.dart';

Future<dynamic> fetchShops({dynamic query}) async {
  try {
    final api = ApiManager();
    final dynamic response;

    if (query != null) {
      response = await api.getsApiCall("shop", params: query);
    } else {
      response = await api.getsApiCall("shop");
    }

    return compute(parseShops, response["results"]);
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}

Future<List<SellCompany>> fetchShopsByCategory() async {
  final api = ApiManager();
  final response = await api.getsApiCall("$apiUrl/shop");

  return compute(parseShops, response["results"]);
}
