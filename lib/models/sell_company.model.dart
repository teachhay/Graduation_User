import 'package:userapp/models/address.model.dart';
import 'package:userapp/models/category.model.dart';

class SellCompany {
  final String id;
  final String name;
  final String description;
  final String logo;
  final String remark;
  final List<ShopCategory> categories;
  final Address address;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;

  const SellCompany({
    required this.id,
    required this.name,
    required this.description,
    required this.logo,
    required this.remark,
    required this.categories,
    required this.address,
    required this.updatedAt,
    required this.createdAt,
    required this.isActive,
  });

  factory SellCompany.fromJson(Map<String, dynamic> json) {
    return SellCompany(
      id: json["id"] as String,
      name: json["name"] as String,
      description: json["description"] as String,
      remark: json["remark"] as String,
      logo: json["logo"] as String,
      categories: json["categories"].length != 0 ? json["categories"].map<ShopCategory>((json) => ShopCategory.fromJson(json)).toList() : [],
      address: Address.fromJson(json["address"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      createdAt: DateTime.parse(json["createdAt"]),
      isActive: json["isActive"] as bool,
    );
  }
}

List<SellCompany> parseShops(dynamic body) {
  return body.map<SellCompany>((json) => SellCompany.fromJson(json)).toList();
}
