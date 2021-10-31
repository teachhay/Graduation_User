import 'package:flutter/material.dart';
import 'package:userapp/models/user.model.dart';

class AppState extends ChangeNotifier {
  User? userInfo;
  String token = "";

  User? get getUserInfo {
    return userInfo;
  }

  String get getToken {
    return token;
  }

  void setToken({required String token}) {
    token = token;
    notifyListeners();
  }

  void setUserInfo({required User userInfo}) {
    userInfo = userInfo;
    notifyListeners();
  }

  void resetState() {
    token = "";
    userInfo = null;
  }
}
