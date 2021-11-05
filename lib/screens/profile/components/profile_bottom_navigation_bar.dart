import 'package:flutter/material.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/services/user.service.dart';

class ProfileBottomNavigationBar extends StatefulWidget {
  const ProfileBottomNavigationBar({Key? key, required this.isUpdate, required this.updateIsUpdate, required this.userData}) : super(key: key);
  final bool isUpdate;
  final Function updateIsUpdate;
  final Map userData;

  @override
  _ProfileBottomNavigationBarState createState() => _ProfileBottomNavigationBarState();
}

class _ProfileBottomNavigationBarState extends State<ProfileBottomNavigationBar> {
  late Map userData;

  @override
  Widget build(BuildContext context) {
    userData = widget.userData;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: const BorderRadius.only(
        //   topLeft: Radius.circular(12),
        //   topRight: Radius.circular(12),
        // ),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: const Offset(0, -2),
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: ElevatedButton.icon(
        icon: Icon(
          widget.isUpdate ? Icons.save : Icons.edit,
          size: 18,
        ),
        label: Text(widget.isUpdate ? "Save" : "Edit"),
        style: ElevatedButton.styleFrom(
          primary: widget.isUpdate ? Colors.green : Theme.of(context).primaryColorDark,
        ),
        onPressed: () async {
          if (widget.isUpdate == true) {
            print(widget.userData);
          }

          // if (widget.isUpdate == true) {
          //   dynamic response = await updateUserInfo(user: "");

          //   if (response is ErrorResponse) {
          //     ScaffoldMessenger.of(context).showSnackBar(
          //       SnackBar(
          //         content: Text(response.message),
          //         duration: const Duration(seconds: 2),
          //       ),
          //     );

          //     return;
          //   }

          //   if (response is PostResponse) {
          //     PostResponse tempRes = response;

          //     if (tempRes.meta == 200) {
          //       ScaffoldMessenger.of(context).showSnackBar(
          //         const SnackBar(
          //           content: Text("Update successful"),
          //           duration: Duration(seconds: 2),
          //         ),
          //       );
          //       return;
          //     }
          //   }

          //   ScaffoldMessenger.of(context).showSnackBar(
          //     const SnackBar(
          //       content: Text("General Error"),
          //       duration: Duration(seconds: 2),
          //     ),
          //   );
          // }

          widget.updateIsUpdate();
        },
      ),
    );
  }
}
