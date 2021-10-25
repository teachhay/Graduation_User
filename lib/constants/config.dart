import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/models/user.model.dart';

late SharedPreferences prefs;
String? token;
User? userinfo;
const String tokenKey = "token";
