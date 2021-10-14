import 'package:flutter/material.dart';
import 'package:userapp/models/user.dart';
import 'package:userapp/services/index.dart';
import 'package:userapp/widgets/appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                  color: Colors.grey.shade300,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    for (var i = 0; i < 5; i++)
                      Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        color: Colors.accents[i],
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.all(15),
      //   height: 70,
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: const BorderRadius.only(
      //       topLeft: Radius.circular(12),
      //       topRight: Radius.circular(12),
      //     ),
      //     boxShadow: [
      //       BoxShadow(
      //         blurRadius: 6,
      //         offset: const Offset(0, -2),
      //         color: Colors.black.withOpacity(0.3),
      //       ),
      //     ],
      //   ),
      //   child: ElevatedButton(
      //     onPressed: () {
      //       print("Logout Clicked");
      //     },
      //     child: const Text("Logout"),
      //   ),
      // ),
    );
  }
}
