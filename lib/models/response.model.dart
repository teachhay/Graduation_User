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
