import 'package:flutter/material.dart';
import 'package:userapp/screens/Home/components/category_list_card.dart';
import 'package:userapp/screens/Home/components/shop_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text("Home page"),
        widgets: [
          IconButton(onPressed: () => Navigator.pushNamed(context, "/cart"), icon: const Icon(Icons.shopping_cart)),
        ],
      ),
      drawer: const CustomDrawer(),
      body: const HomePage(),
      // bottomNavigationBar: CustomNavigationBar(
      //   selectedIndex: currentIndex,
      //   onTap: _onTapButton,
      // ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: NetworkImage("https://images.unsplash.com/photo-1524758631624-e2822e304c36?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80"),
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: const Text(
                "User 1",
                style: TextStyle(
                  color: Colors.black,
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
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage("https://scontent.fpnh7-1.fna.fbcdn.net/v/t1.6435-9/203765174_3022888314627410_829940207297098355_n.jpg?_nc_cat=103&ccb=1-5&_nc_sid=09cbfe&_nc_eui2=AeHtGeTsl_W0Hap9GgEnOMpxauurmcxsncxq66uZzGydzC7rSb2ob2mzR_-fGvsNYOkhv8spFCN_7Hs57oPUBzZf&_nc_ohc=NXECgTyZ-BEAX8gZZve&_nc_ht=scontent.fpnh7-1.fna&oh=fa02f3ddc961e88a95632ec3819619be&oe=619530D4"),
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
