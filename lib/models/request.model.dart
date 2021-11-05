// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

import 'package:userapp/constants/api.dart';
import 'package:userapp/constants/config.dart';
import 'package:userapp/models/response.model.dart';

class ApiManager {
  final Map<String, String> headers = {
    "Accept": "application/json",
    "Content-type": "application/json; charset=UTF-8",
    "Authorization": token ?? "",
  };

  Future<dynamic> getsApiCall(String url, {dynamic params}) async {
    try {
      print("Calling GET API: /$url");

      final dynamic response;

      if (params != null) {
        String queryString = Uri(queryParameters: params).query;

        response = await http.get(Uri.parse("$apiUrl/$url?" + queryString), headers: headers);
      } else {
        response = await http.get(Uri.parse("$apiUrl/$url"), headers: headers);
      }

      GetsResponse getsResponse = GetsResponse.fromJson(_response(response));

      return getsResponse;
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<dynamic> getApiCall(String url, {dynamic params}) async {
    try {
      print("Calling GET By Id API: /$url");

      final dynamic response;

      if (params != null) {
        String queryString = Uri(queryParameters: params).query;

        response = await http.get(Uri.parse("$apiUrl/$url?" + queryString), headers: headers);
      } else {
        response = await http.get(Uri.parse("$apiUrl/$url"), headers: headers);
      }

      GetResponse getResponse = GetResponse.fromJson(_response(response));

      return getResponse;
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<dynamic> postApiCall(String url, Map data) async {
    try {
      print("Calling POST API: /$url");
      print("Calling parameters: ${jsonEncode(data)}");

      Response response = await http.post(Uri.parse("$apiUrl/$url"), body: jsonEncode(data), headers: headers).timeout(const Duration(seconds: 5));
      PostResponse post = PostResponse.fromJson(_response(response));

      return post;
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<dynamic> putApiCall(String url, dynamic data) async {
    try {
      print("Calling PUT API: /$url");
      print("Calling parameters: ${jsonEncode(data)}");

      Response response = await http.put(Uri.parse("$apiUrl/$url"), body: jsonEncode(data), headers: headers).timeout(const Duration(seconds: 5));
      PostResponse post = PostResponse.fromJson(_response(response));

      return post;
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }
}

class AuthRequest {
  final Map<String, String> headers = {
    "Accept": "application/json",
    "Content-type": "application/json; charset=UTF-8",
    "Authorization": token ?? "",
  };

  Future<dynamic> postApiCall(String url, Map data) async {
    try {
      print("Calling POST AUTH API: /$url");
      print("Calling parameters: $data");

      final response = await http.post(Uri.parse("$authUrl/$url"), body: jsonEncode(data), headers: headers).timeout(const Duration(seconds: 5));
      LoginResponse post = LoginResponse.fromJson(_response(response));

      print(post.meta);

      return post;
    } on SocketException catch (e) {
      throw Exception(e.message);
    } on TimeoutException catch (e) {
      throw Exception(e.message);
    }
  }
}

dynamic _response(http.Response response) {
  var responseJson = json.decode(response.body.toString());

  switch (response.statusCode) {
    case 200:
      return responseJson;
    case 201:
      return responseJson;
    case 400:
      // return BadRequestException(response.body.toString());
      return responseJson;
    case 401:
      if (responseJson["meta"] == 4001) {
        navigatorKey!.currentState!.pushReplacementNamed('/login');
      }

      return responseJson;
    case 403:
      return UnauthorisedException(response.body.toString());
    case 500:
    default:
      return responseJson;
    // throw FetchDataException('Error occured while Communication with Server with StatusCode: ${response.statusCode}');
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
