import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/category.model.dart';
import 'package:userapp/models/response.model.dart';

Future<dynamic> fetchCategories() async {
  try {
    final api = ApiManager();
    GetsResponse response = await api.getsApiCall("category");
    response.results = await compute(parseCategories, response.results);

    return response;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}
