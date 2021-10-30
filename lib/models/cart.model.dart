import 'package:flutter/material.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/service.model.dart';

class Cart extends ChangeNotifier {
  List<SubService> services = [];
  String shopId = "";

  List<SubService> get getServices {
    return services;
  }

  String get getShopId {
    return shopId;
  }

  void addService(ShopService service) {
    services.add(SubService(id: "", service: service, date: DateTime.now()));
    notifyListeners();
  }

  void removeService(ShopService service) {
    services.remove(SubService(id: "", service: service, date: DateTime.now()));
    notifyListeners();
  }

  void clearServices() {
    services = [];
    notifyListeners();
  }

  void setShopId(String id) {
    shopId = id;
    notifyListeners();
  }
}
