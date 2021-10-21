import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/screens/Cart/confirm.dart';
import 'package:userapp/screens/Cart/confirm_cart.dart';
import 'package:userapp/screens/Cart/index.dart';
import 'package:userapp/screens/DetailByCategory/index.dart';
import 'package:userapp/screens/Home/index.dart';
import 'package:userapp/screens/login/index.dart';
import 'package:page_transition/page_transition.dart';
import 'package:userapp/screens/order/index.dart';
import 'package:userapp/screens/profile/index.dart';
import 'package:userapp/screens/review/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Appointment(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Colors.deepPurple,
          // scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/home',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return PageTransition(child: const LoginScreen(), type: PageTransitionType.rightToLeftWithFade);
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
              return PageTransition(child: const ConfirmScreen(), type: PageTransitionType.rightToLeftWithFade);
            default:
              return null;
          }
        },
      ),
    );
  }
}
