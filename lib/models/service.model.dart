import 'sell_company.model.dart';

class ShopService {
  final String id;
  final String name;
  final dynamic price;
  final SellCompany sellCompany;
  final String remark;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isActive;

  const ShopService({
    required this.id,
    required this.name,
    required this.price,
    required this.remark,
    required this.sellCompany,
    required this.createdAt,
    required this.updatedAt,
    required this.isActive,
  });

  factory ShopService.init() {
    return ShopService(
      id: "",
      name: "",
      price: "",
      remark: "",
      sellCompany: SellCompany.init(),
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isActive: true,
    );
  }

  factory ShopService.fromJson(Map<String, dynamic> json) {
    return ShopService(
      id: json["id"] as String,
      name: json["name"] as String,
      price: json["price"] as dynamic,
      remark: json["remark"] as String,
      sellCompany: SellCompany.fromJson(json["sellCompany"]),
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
      isActive: json["isActive"] as bool,
    );
  }
}

List<ShopService> parseServices(dynamic body) {
  return body.map<ShopService>((json) => ShopService.fromJson(json)).toList();
}
