import 'package:flutter/material.dart';
import 'package:userapp/constants/config.dart';

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
              child: Text(
                userinfo!.firstName + " " + userinfo!.lastName,
                style: const TextStyle(
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
          // ListTile(
          //   leading: const Icon(Icons.comment),
          //   title: const Text("Reviews"),
          //   onTap: () {
          //     Navigator.pop(context);
          //     Navigator.pushNamed(context, "/review");
          //   },
          // ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pop(context);
              prefs.clear();
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
        ],
      ),
    );
  }
}
