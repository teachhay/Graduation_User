import 'dart:convert';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/user.model.dart';
import 'package:http/http.dart' as http;

Future<User> login() async {
  final response = await http.post(
    Uri.parse("$authUrl/userlogin"),
    headers: <String, String>{
      "Content-type": "application/json; charset=UTF-8",
      "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MTQ0MjlhNmI4MWQyYjIxYWMzMzhmZDMiLCJpYXQiOjE2MzI5MjM3NTd9._Plg48ccHQW0OQAtWlezgMKvQ3Lq4PIgXaU8xf7OCtM",
    },
    body: jsonEncode(<String, String>{
      "email": "user@gmail.com",
      "password": "admin123",
    }),
  );

  if (response.statusCode == 200) {
    final User user = User.fromJson(jsonDecode(response.body)["user"]);
    return user;
  } else {
    throw Exception('Failed to load album');
  }
}
