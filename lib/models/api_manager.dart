// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:userapp/constants/api.dart';

class ApiManager {
  final Map<String, String> headers = {
    "Accept": "application/json",
    "Content-type": "application/json; charset=UTF-8",
    "Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MTQ0MjlhNmI4MWQyYjIxYWMzMzhmZDMiLCJpYXQiOjE2MzI5MjM3NTd9._Plg48ccHQW0OQAtWlezgMKvQ3Lq4PIgXaU8xf7OCtM",
  };
  // Map<String, String> queryParameters = {"foo": "bar"};

  Future<dynamic> postApiCall(String url, Map param) async {
    try {
      print("Calling POST API: $url");
      print("Calling parameters: $param");

      final response = await http.post(Uri.parse(url), body: param, headers: headers).timeout(const Duration(seconds: 5));

      return _response(response);
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<dynamic> getsApiCall(String url) async {
    try {
      print("Calling GET API: $url");
      final response = await http.get(Uri.parse(url), headers: headers);

      return _response(response);
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<dynamic> putApiCall(String url, body) async {
    try {
      print("Calling PUT API: $url");
      print("Calling parameters: $body");

      final response = await http.put(Uri.parse(url), body: body, headers: headers).timeout(const Duration(seconds: 5));

      return _response(response);
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<dynamic> getApiCall(String url) async {
    try {
      print("Calling GET By Id API: $url");

      final response = await http.put(Uri.parse(url), headers: headers).timeout(const Duration(seconds: 5));

      return _response(response);
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final String? message;
  final String? prefix;

  CustomException([this.message, this.prefix]);

  @override
  String toString() {
    return "$prefix$message";
  }
}

class FetchDataException extends CustomException {
  FetchDataException([String? message]) : super(message, "Error During Communication: ");
}

class BadRequestException extends CustomException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends CustomException {
  UnauthorisedException([message]) : super(message, "Unauthorised: ");
}

class InvalidInputException extends CustomException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
