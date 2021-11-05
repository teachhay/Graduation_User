import 'package:flutter/material.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/screens/profile/components/custom_input_label.dart';
import 'package:userapp/screens/profile/components/profile_bottom_navigation_bar.dart';
import 'package:userapp/widgets/appbar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double borderRadius = 10;
  bool isUpdate = false;
  TextEditingController firstNameController = TextEditingController(text: "John");
  TextEditingController lastNameController = TextEditingController(text: "Doe");

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> userData = {
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
    };

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Profile Page"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(borderRadius),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8,
                          color: Colors.grey.shade400,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius - 2),
                      child: Image.network(
                        "$fileUrl/08355a38e1897627e62076628d036bc4.jpg", //FIXME replace user's profile from userInfo
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Divider(thickness: 2),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: const Text(
                      "User Info",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Firstname", isUpdate: isUpdate),
                  TextField(
                    controller: firstNameController,
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter first name',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Lastname", isUpdate: isUpdate),
                  TextField(
                    controller: lastNameController,
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter last name',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Date of birth", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Select date of birth',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Email", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter email',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Password", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter password',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Phone number", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Role Type", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Role type',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Status", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Status',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Divider(thickness: 2),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    margin: const EdgeInsets.only(left: 20),
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: const Text(
                      "Address Info",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "House number", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter house number',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Street number", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter street number',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "City", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter City',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "State", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter state',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Country", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter country',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Zipcode", isUpdate: isUpdate),
                  TextField(
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter zipcode',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: ProfileBottomNavigationBar(
      //   userData: userData,
      //   isUpdate: isUpdate,
      //   updateIsUpdate: () => setState(() => isUpdate = !isUpdate),
      // ),
      bottomNavigationBar: Container(
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
            isUpdate ? Icons.save : Icons.edit,
            size: 18,
          ),
          label: Text(isUpdate ? "Save" : "Edit"),
          style: ElevatedButton.styleFrom(
            primary: isUpdate ? Colors.green : Theme.of(context).primaryColorDark,
          ),
          onPressed: () async {
            if (isUpdate == true) {
              print(userData);
            }

            // if (isUpdate == true) {
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

            // updateIsUpdate();
            setState(() {
              print(isUpdate);
              isUpdate = !isUpdate;
            });
          },
        ),
      ),
    );
  }
}
