import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:userapp/constants/api.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = List.generate(15, (index) => 'Hello ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
            for (var i = 0; i < 5; i++) const Homecard(),
          ],
        ),
      ),
    );
  }
}

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 1; i < 16; i++)
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.fromLTRB(6, 8, 6, 8),
                width: 100,
                decoration: BoxDecoration(
                  // color: Colors.accents[i],
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: -2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      color: Colors.grey.shade300,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network("https://source.unsplash.com/random", fit: BoxFit.cover, width: 100, height: 100),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      child: const Text(
                        "Service and Maintence",
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/categorydetail');
              },
            ),
        ],
      ),
    );
  }
}

class Homecard extends StatelessWidget {
  const Homecard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey.shade400,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, 6),
              ),
            ],
          ),
          width: double.infinity,
          height: 180,
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("images/logo.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/shopdetail");
      },
    );
  }
}
