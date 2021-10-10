import 'package:flutter/material.dart';
import 'package:userapp/screens/DetailByCategory/index.dart';
import 'package:userapp/screens/Home/index.dart';
import 'package:userapp/screens/login/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
        // When navigating to the "/" route, build the FirstScreen widget.
        '/login': (context) => const LoginScreen(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/home': (context) => const HomeScreen(),
        "/categorydetail": (context) => const DetailByCategory(),
      },
    );
  }
}
