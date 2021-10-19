import 'package:flutter/material.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/models/user.model.dart';
import 'package:userapp/services/sell_company.service.dart';
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
      appBar: const CustomAppBar(
        title: Text("Profile Page"),
      ),
      body: FutureBuilder<List<SellCompany>>(
        future: fetchShops(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('An error has occurred!'));
          } else if (snapshot.hasData) {
            return const Center(child: Text("ok"));
            // return ProfileCard(user: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // body: SingleChildScrollView(
      //   scrollDirection: Axis.vertical,
      //   child: Container(
      //     margin: const EdgeInsets.all(8),
      //     child: Column(
      //       children: [
      //         Container(
      //           height: 200,
      //           decoration: BoxDecoration(
      //             color: Colors.white,
      //             boxShadow: [
      //               BoxShadow(
      //                 blurRadius: 8,
      //                 offset: const Offset(0, 3),
      //                 color: Colors.black45.withOpacity(0.2),
      //               ),
      //             ],
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      //         ),
      //         const SizedBox(height: 10),
      //         const Text("Firstname"),
      //         const Text("Lastname"),
      //       ],
      //     ),
      //   ),
      // ),
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

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Text(user.firstName.toString()),
          Text(user.lastName.toString()),
        ],
      ),
    );
  }
}
