// ignore_for_file: avoid_print, unused_import, todo

//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

//Constants
import 'package:userapp/constants/config.dart';
import 'package:userapp/models/app_state.model.dart';

//Model
import 'package:userapp/models/cart.model.dart';
import 'package:userapp/models/response.model.dart';

//Screens
import 'package:userapp/screens/Cart/confirmed.dart';
import 'package:userapp/screens/Cart/confirm_cart.dart';
import 'package:userapp/screens/Cart/index.dart';
import 'package:userapp/screens/Home/index.dart';
import 'package:userapp/screens/login/index.dart';
import 'package:userapp/screens/order/index.dart';
import 'package:userapp/screens/profile/edit_profile.dart';
import 'package:userapp/screens/profile/index.dart';
import 'package:userapp/screens/review/index.dart';
import 'package:userapp/services/auth.service.dart';
import 'package:userapp/widgets/general_message.dart';

void main() {
  runApp(const MyApp());
}

//REWORK rework futurebuilder response, service logics, indicator
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //TODO convert state variable to Class
  Future<dynamic> initApp() async {
    prefs = await SharedPreferences.getInstance();
    token = prefs.getString(tokenKey) ?? "";
    navigatorKey = GlobalKey<NavigatorState>();

    print("Token - $token");

    //TODO Fetch userinfo based on token
    if (userinfo == null) {
      dynamic response = await fetchUserInfo();

      if (response is ErrorResponse) {
        ErrorResponse error = response;
        print(error.message);
        return error;
      }

      if (response is UserInfoResponse) {
        UserInfoResponse user = response;

        userinfo = user.userInfo;
      }
    }

    return true;
    // return Future.delayed(const Duration(seconds: 5), () => true); // simulate server delay
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initApp(),
      builder: (context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CustomMaterialApp(child: Center(child: CircularProgressIndicator()));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.data == true) {
            return const MainMaterialApp();
          }

          if (snapshot.data is ErrorResponse) {
            ErrorResponse error = snapshot.data;

            return CustomMaterialApp(child: GeneralMessage(message: error.message));
          }
        }

        return const CustomMaterialApp(child: GeneralMessage(message: "Error occurred during initialize app"));
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
        initialRoute: token != "" ? "/profile" : "/login",
        navigatorKey: navigatorKey,
        onGenerateRoute: (settings) {
          // print("Route ${settings.name}");
          switch (settings.name) {
            case '/login':
              return PageTransition(child: const LoginScreen(), type: PageTransitionType.fade);
            case '/home':
              return PageTransition(child: const HomeScreen(), type: PageTransitionType.fade);
            case '/profile':
              return PageTransition(child: const ProfileScreen(), type: PageTransitionType.fade);
            case '/editprofile':
              return PageTransition(child: const EditProfileScreen(), type: PageTransitionType.fade);
            case '/order':
              return PageTransition(child: const OrderScreen(), type: PageTransitionType.fade);
            // case '/review':
            //   return PageTransition(child: const ReviewScreen(), type: PageTransitionType.fade); //on hold
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
          child: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: child,
          ),
        ),
      ),
    );
  }
}
