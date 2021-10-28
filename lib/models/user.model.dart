import 'package:userapp/models/address.model.dart';

class User {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final DateTime? dob;
  final String? profilePic;
  final String? email;
  final String? password;
  final int? type;
  final bool? isActive;
  final Address? address;

  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dob,
    required this.profilePic,
    required this.email,
    required this.password,
    required this.type,
    required this.isActive,
    required this.address,
  });

  factory User.init() {
    return User(
      id: "",
      firstName: "",
      lastName: "",
      phoneNumber: "",
      dob: DateTime.now(),
      profilePic: "",
      email: "",
      password: "",
      type: 0,
      isActive: true,
      address: Address.init(),
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json["id"] as String,
      firstName: json["firstName"] as String,
      lastName: json["lastName"] as String,
      phoneNumber: json["phoneNumber"] as String,
      dob: DateTime.parse(json["dob"]),
      profilePic: json["profilePic"] as String,
      email: json["email"] as String,
      password: json["password"] as String,
      type: json["type"] as int,
      isActive: json["isActive"] as bool,
      address: Address.fromJson(json["address"]),
    );
  }
}
