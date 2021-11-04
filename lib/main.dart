//Packages
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Constants
import 'package:userapp/constants/config.dart';
import 'package:userapp/models/app_state.model.dart';

//Model
import 'package:userapp/models/cart.model.dart';

//Screens
import 'package:userapp/screens/Cart/confirmed.dart';
import 'package:userapp/screens/Cart/confirm_cart.dart';
import 'package:userapp/screens/Cart/index.dart';
import 'package:userapp/screens/Home/index.dart';
import 'package:userapp/screens/login/index.dart';
import 'package:userapp/screens/order/index.dart';
import 'package:userapp/screens/profile/index.dart';
import 'package:userapp/screens/review/index.dart';
import 'package:userapp/widgets/general_message.dart';
import 'package:userapp/widgets/loading_indicator.dart';

void main() {
  runApp(const MyApp());
}

//ignore: todo
//TODO rework futurebuilder response, service logics, indicator
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //ignore: todo
  //TODO convert state variable to Class
  Future<bool> initApp() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString(tokenKey) ?? "";
    navigatorKey = GlobalKey<NavigatorState>();

    print("Token - $token");

    // ignore: todo
    //TODO Fetch userinfo based on token
    if (userinfo == null) {}

    return true;
    // return Future.delayed(const Duration(seconds: 5), () => true); //real server simulation
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initApp(),
      builder: (context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasError) {
          return const CustomMaterialApp(child: GeneralMessage(message: "Error occurred during initialize app"));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return const MainMaterialApp();
        }

        return const CustomMaterialApp(child: LoadingIndicator());
      },
    );
  }
}

class MainMaterialApp extends StatelessWidget {
  const MainMaterialApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => AppState()),
      ],
      child: MaterialApp(
        title: 'User App',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.deepPurple,
          // scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: token != "" ? "/order" : "/login",
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return PageTransition(child: const LoginScreen(), type: PageTransitionType.fade);
            case '/home':
              return PageTransition(child: const HomeScreen(), type: PageTransitionType.fade);
            case '/profile':
              return PageTransition(child: const ProfileScreen(), type: PageTransitionType.fade);
            case '/order':
              return PageTransition(child: const OrderScreen(), type: PageTransitionType.fade);
            case '/review':
              return PageTransition(child: const ReviewScreen(), type: PageTransitionType.fade);
            // case '/categorydetail':
            //   return PageTransition(child: const DetailByCategory(), type: PageTransitionType.rightToLeftWithFade);
            // case '/shopdetail':
            //   return PageTransition(child: const ShopDetail(), type: PageTransitionType.rightToLeftWithFade);
            case '/cart':
              return PageTransition(child: const CartScreen(), type: PageTransitionType.rightToLeftWithFade);
            case '/confirmcart':
              return PageTransition(child: const ConfirmCartScreen(), type: PageTransitionType.rightToLeftWithFade);
            case '/confirm':
              return PageTransition(child: const ConfirmScreen(), type: PageTransitionType.fade);
            default:
              return null;
          }
        },
      ),
    );
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({Key? key, this.child = const GeneralMessage()}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: child,
        ),
      ),
    );
  }
}
