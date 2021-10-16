import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/sell_company.model.dart';
import "package:http/http.dart" as http;

Future<List<SellCompany>> fetchShops() async {
  final response = await http.get(Uri.parse("$apiUrl/shop"), headers: <String, String>{"Content-type": "application/json; charset=UTF-8", "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MTQ0MjlhNmI4MWQyYjIxYWMzMzhmZDMiLCJpYXQiOjE2MzI5MjM3NTd9._Plg48ccHQW0OQAtWlezgMKvQ3Lq4PIgXaU8xf7OCtM"});

  if (response.statusCode == 200) {
    return compute(parseShops, jsonDecode(response.body)["results"]);
  }

  throw Expando("Failed to load shop");
}
