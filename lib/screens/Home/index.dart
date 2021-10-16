import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:userapp/constants/api.dart';
import 'package:intl/intl.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/screens/Home/components/category_list_card.dart';
import 'package:userapp/screens/Home/components/shop_card.dart';
import 'package:userapp/screens/home/index.dart';
import 'package:userapp/screens/profile/index.dart';
import 'package:userapp/services/sell_company.service.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/botton_navigation_bar.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Home Page"),
        widgets: [
          IconButton(onPressed: () => Navigator.pushNamed(context, "/cart"), icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: NetworkImage("https://source.unsplash.com/random"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: const Text(
                  "User 1",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_box),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/profile");
              },
            ),
            ListTile(
              leading: const Icon(Icons.list_alt),
              title: const Text("Orders"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/order");
              },
            ),
            ListTile(
              leading: const Icon(Icons.comment),
              title: const Text("Reviews"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/review");
              },
            ),
          ],
        ),
      ),
      body: const HomePage(),
      // bottomNavigationBar: CustomNavigationBar(
      //   selectedIndex: currentIndex,
      //   onTap: _onTapButton,
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
          const SizedBox(height: 10),
          const SectionTitle(title: "Category"),
          const CategoryList(),
          const SizedBox(height: 10),
          const SectionTitle(title: "Shops"),
          FutureBuilder<List<SellCompany>>(
            future: fetchShops(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const SizedBox(height: 150, child: Center(child: CircularProgressIndicator()));
              }
              if (snapshot.hasError) {
                return const Center(child: Text('An error has occurred!'));
              }

              List<SellCompany> shops = snapshot.data ?? [];

              return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    for (var i in shops) ShopCard(sellCompany: i),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
