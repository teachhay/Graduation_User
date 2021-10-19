import 'dart:convert';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/user.model.dart';
import 'package:http/http.dart' as http;

List<User> parseUsers(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<User>((json) => User.fromJson(json)).toList();
}

Future<User> fetchUser(String id) async {
  final response = await http.get(Uri.parse("$apiUrl/user/$id"), headers: <String, String>{"Content-type": "application/json; charset=UTF-8", "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MTQ0MjlhNmI4MWQyYjIxYWMzMzhmZDMiLCJpYXQiOjE2MzI5MjM3NTd9._Plg48ccHQW0OQAtWlezgMKvQ3Lq4PIgXaU8xf7OCtM"});

  if (response.statusCode == 200) {
    final User user = User.fromJson(jsonDecode(response.body)["data"]);

    return Future.delayed(const Duration(seconds: 2), () {
      return user;
    });
  } else {
    throw Exception('Failed to load user');
  }
}
