// import 'CustomException.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';
// import 'package:connectivity/connectivity.dart';

class ApiManager {
  Future<dynamic> postAPICall(String url, Map param) async {
    print("Calling POST API: $url");
    print("Calling parameters: $param");

    var responseJson;
    try {
      final response = await http.post(Uri.parse(url), body: param);
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static Future<dynamic> getAPICall(String url) async {
    print("Calling GET API: $url");

    var responseJson;
    try {
      final response = await http.get(Uri.parse(url));
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while Communication with Server with StatusCode: ${response.statusCode}');
    }
  }
}

class CustomException implements Exception {
  final message;
  final prefix;

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
