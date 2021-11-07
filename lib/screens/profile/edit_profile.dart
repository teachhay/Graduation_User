//ignore_for_file: todo, print, unused_import

import 'package:flutter/material.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/screens/profile/components/custom_input_label.dart';
import 'package:userapp/services/user.service.dart';
import 'package:userapp/widgets/appbar.dart';

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final double borderRadius = 10;
  bool isUpdate = false;
  TextEditingController firstNameController = TextEditingController(text: "John");
  TextEditingController lastNameController = TextEditingController(text: "Doe");
  DateTime dobController = DateTime(DateTime.now().year - 10);
  TextEditingController dobEditController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "teachhaylim@gmail.com");
  TextEditingController phoneNumberController = TextEditingController(text: "015 876 631");
  TextEditingController roleTypeController = TextEditingController(text: "User");
  TextEditingController statusController = TextEditingController(text: "False");

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.year,
      initialDate: dobController,
      firstDate: DateTime(DateTime.now().year - 50),
      lastDate: DateTime(DateTime.now().year - 10),
    );

    if (newSelectedDate != null) {
      dobController = newSelectedDate;
      dobEditController.text = "${dobController.month}/${dobController.day}/${dobController.year}";
    }
  }

  _setIsUpdate() {
    setState(() {
      isUpdate = !isUpdate;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    focusNode: AlwaysDisabledFocusNode(),
                    controller: dobEditController,
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Select date of birth',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                    onTap: () => _selectDate(context),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInputLabel(text: "Email", isUpdate: isUpdate),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
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
              //TODO update password
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
                    keyboardType: TextInputType.number,
                    controller: phoneNumberController,
                    readOnly: !isUpdate,
                    decoration: InputDecoration(
                      hintText: 'Enter phone number',
                      contentPadding: EdgeInsets.zero,
                      enabled: isUpdate,
                    ),
                  ),
                ],
              ),
              //TODO show roletype?
              // const SizedBox(height: 18),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     CustomInputLabel(text: "Role Type", isUpdate: isUpdate),
              //     TextField(
              //       controller: roleTypeController,
              //       decoration: const InputDecoration(
              //         hintText: 'Role type',
              //         contentPadding: EdgeInsets.zero,
              //         enabled: false,
              //       ),
              //     ),
              //   ],
              // ),
              //TODO show status?
              // const SizedBox(height: 18),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     CustomInputLabel(text: "Status", isUpdate: isUpdate),
              //     TextField(
              //       controller: statusController,
              //       decoration: const InputDecoration(
              //         hintText: 'Status',
              //         contentPadding: EdgeInsets.zero,
              //         enabled: false,
              //       ),
              //     ),
              //   ],
              // ),
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
              Map<String, dynamic> userData = {
                "firstname": firstNameController.text,
                "lastname": lastNameController.text,
                "dob": dobController.toIso8601String(),
                "email": emailController.text,
                // "password": lastNameController.text,
                "phoneNumber": phoneNumberController.text,
                // "roleType": lastNameController.text,
                // "isActive": lastNameController.text,
              };
              dynamic response;
              // dynamic response = await updateUserInfo(user: userData);

              if (response is ErrorResponse) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.red,
                    content: Text(response.message),
                    duration: const Duration(seconds: 2),
                  ),
                );

                _setIsUpdate();

                return;
              }

              if (response is PostResponse) {
                PostResponse tempRes = response;

                if (tempRes.meta == 200) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.green,
                      content: Text("Update successful"),
                      duration: Duration(seconds: 2),
                    ),
                  );

                  _setIsUpdate();
                  return;
                }
              }
            }

            _setIsUpdate();
          },
        ),
      ),
    );
  }
}
