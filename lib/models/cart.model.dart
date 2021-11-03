import 'package:flutter/material.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/models/service.model.dart';

class Cart extends ChangeNotifier {
  List<SubService> services = [];
  SellCompany? shop;

  List<SubService> get getServices {
    return services;
  }

  SellCompany? get getShop {
    return shop;
  }

  void addService(ShopService service) {
    services.add(SubService(id: "", service: service, date: DateTime.now()));
    notifyListeners();
  }

  void removeService(ShopService service) {
    services.remove(SubService(id: "", service: service, date: DateTime.now()));
    notifyListeners();
  }

  void removeSubService(SubService subService) {
    services.remove(subService);
    notifyListeners();
  }

  void clearServices() {
    services = [];
    notifyListeners();
  }

  void setShop(SellCompany data) {
    shop = data;
    notifyListeners();
  }

  void reset() {
    services = [];
    shop = null;
  }
}
