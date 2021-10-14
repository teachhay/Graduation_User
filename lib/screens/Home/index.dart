import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:userapp/constants/api.dart';
import 'package:intl/intl.dart';
import 'package:userapp/screens/Home/components/category_list_card.dart';
import 'package:userapp/screens/Home/components/shop_card.dart';
import 'package:userapp/screens/profile/index.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/botton_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = List.generate(15, (index) => 'Hello ${index + 1}');
  int currentIndex = 0;

  _onTapButton(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: currentIndex == 0
          ? CustomAppBar(
              title: currentIndex == 0 ? const Text("Home Page") : const Text("Profile Page"),
              widgets: [
                if (currentIndex == 0) IconButton(onPressed: () => Navigator.pushNamed(context, "/cart"), icon: const Icon(Icons.shopping_cart)),
              ],
            )
          : null,
      // appBar: CustomAppBar(
      //   title: currentIndex == 0 ? const Text("Home Page") : const Text("Profile Page"),
      //   widgets: [
      //     if (currentIndex == 0) IconButton(onPressed: () => Navigator.pushNamed(context, "/cart"), icon: const Icon(Icons.shopping_cart)),
      //   ],
      // ),
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomePage(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        selectedIndex: currentIndex,
        onTap: _onTapButton,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

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
            children: const [
              Text(
                "Welcome back!",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://source.unsplash.com/random",
                  // "$fileUrl/08355a38e1897627e62076628d036bc4.jpg",
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 1, indent: 50, endIndent: 50),
          const Text(
            "Category",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const CategoryList(),
          const Text(
            "Shops",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          for (var i = 0; i < 5; i++) const ShopCard(),
        ],
      ),
    );
  }
}
