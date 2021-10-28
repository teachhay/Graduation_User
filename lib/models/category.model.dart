class ShopCategory {
  final String id;
  final String name;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String remark;
  final String image;

  const ShopCategory({
    required this.id,
    required this.name,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.remark,
    required this.image,
  });

  factory ShopCategory.init() {
    return ShopCategory(
      id: "",
      name: "",
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      remark: "",
      image: "",
    );
  }

  factory ShopCategory.fromJson(Map<dynamic, dynamic> json) {
    return ShopCategory(
      id: json["id"] as String,
      name: json["name"] as String,
      isActive: json["isActive"] as bool,
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      remark: json["remark"] as String,
      image: json["image"] as String,
    );
  }
}

List<ShopCategory> parseCategories(dynamic body) {
  return body.map<ShopCategory>((json) => ShopCategory.fromJson(json)).toList();
}
