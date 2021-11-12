import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'package:userapp/constants/config.dart';
import 'package:userapp/constants/functions.dart';
import 'package:userapp/models/cart.model.dart';
import 'package:userapp/screens/Home/components/category_list_card.dart';
import 'package:userapp/screens/Home/components/shop_card.dart';
import 'package:userapp/screens/home/components/home_drawer.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int currentIndex = 0;

  // _onTapButton(index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  // _incrementCounter() async {
  //   int counter = (prefs.getInt('counter') ?? 0) + 1;
  //   print('Pressed $counter times.');
  //   await prefs.setInt('counter', counter);
  // }

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: true);

    handleCartClick() {
      if (cart.getShop != null && cart.getServices.isNotEmpty) {
        Navigator.pushNamed(context, "/cart");
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          duration: Duration(seconds: 5),
          content: Text("Please select services first"),
        ),
      );
    }

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Home page"),
        widgets: [
          IconButton(
            onPressed: handleCartClick,
            icon: Badge(
              badgeColor: Colors.deepPurple,
              toAnimate: false,
              child: const Icon(Icons.shopping_cart),
              badgeContent: Consumer<Cart>(
                builder: (context, cart, child) {
                  return Text(
                    cart.getServices.length.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const HomePage(),
      // bottomNavigationBar: CustomNavigationBar(
      //   selectedIndex: currentIndex,
      //   onTap: _onTapButton,
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Welcome back, ${userinfo?.firstName}!",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(checkAvatar()), //REWORK change to rounded square design
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1, indent: 50, endIndent: 50),
          const SizedBox(height: 10),
          const SectionTitle(title: "Category"),
          const CategoryList(),
          const SizedBox(height: 10),
          const SectionTitle(title: "Shops"),
          const ShopList(),
        ],
      ),
    );
  }
}
