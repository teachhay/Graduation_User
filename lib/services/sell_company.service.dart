import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/models/sell_company.model.dart';

Future<dynamic> fetchShops({Map<String, dynamic>? query}) async {
  try {
    final ApiManager api = ApiManager();
    GetsResponse response;

    if (query != null) {
      response = await api.getsApiCall("shop", params: query);
    } else {
      response = await api.getsApiCall("shop");
    }

    //REWORK check meta before return
    response.results = await compute(parseShops, response.results);

    return response;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}

Future<List<SellCompany>> fetchShopsByCategory() async {
  final api = ApiManager();
  final response = await api.getsApiCall("$apiUrl/shop");

  return compute(parseShops, response["results"]);
}
