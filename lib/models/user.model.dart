import 'package:userapp/models/address.model.dart';

class User {
  final String id;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final DateTime dob;
  final String profilePic;
  final String email;
  final String password;
  final int type;
  final bool isActive;
  final Address address;
  final DateTime createdAt;
  final DateTime updatedAt;

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
    required this.createdAt,
    required this.updatedAt,
  });

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
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      address: Address.fromJson(json["address"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "dob": dob,
      "profilePic": profilePic,
      "email": email,
      "password": password,
      "type": type,
      "isActive": isActive,
      "address": address,
      // "": createdAt,
      // "": updatedAt,
    };
  }
}
