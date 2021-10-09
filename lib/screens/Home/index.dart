import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> items = List.generate(10, (index) => 'Hello ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.purpleAccent,
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
          child: Column(
            children: <Widget>[
              Row(
                children: const [
                  Text("Title"),
                ],
              ),
              Container(
                width: double.infinity,
                height: 20,
                color: Colors.red,
              ),
              Container(
                width: double.infinity,
                height: 20,
                color: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
