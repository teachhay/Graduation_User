import 'package:flutter/material.dart';
import 'package:userapp/screens/DetailByCategory/index.dart';
import 'package:userapp/screens/Home/index.dart';
import 'package:userapp/screens/ShopDetail/index.dart';
import 'package:userapp/screens/login/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        "/categorydetail": (context) => const DetailByCategory(),
        "/shopdetail": (context) => const ShopDetail(),
      },
    );
  }
}
