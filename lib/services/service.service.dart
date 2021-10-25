import 'package:flutter/foundation.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/service.model.dart';

Future<List<ShopService>> fetchServies(String shopId) async {
  final api = ApiManager();
  final response = await api.getsApiCall("service?sellCompany=$shopId");

  return compute(parseServices, response["results"]);
}
