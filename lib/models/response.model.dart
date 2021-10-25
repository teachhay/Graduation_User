import 'user.model.dart';

class LoginResponse {
  final int meta;
  final String token;
  final User userInfo;

  const LoginResponse({
    required this.meta,
    required this.token,
    required this.userInfo,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      meta: json["meta"] as int,
      token: json["token"] as String,
      userInfo: User.fromJson(json["user"]),
    );
  }
}

class GetsResponse {
  final int meta;
  dynamic? results;
  final int page;
  final int limit;
  final int totalPages;
  final int totalResults;

  GetsResponse({
    required this.meta,
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });

  factory GetsResponse.fromJson(Map<String, dynamic> json) {
    return GetsResponse(
      meta: json["meta"] as int,
      results: json["results"] as dynamic,
      page: json["page"] as int,
      limit: json["limit"] as int,
      totalPages: json["totalPages"] as int,
      totalResults: json["totalResults"] as int,
    );
  }
}

class ErrorResponse {
  final int meta;
  final String message;

  const ErrorResponse({
    required this.meta,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      meta: json["meta"] as int,
      message: json["message"] as String,
    );
  }
}
