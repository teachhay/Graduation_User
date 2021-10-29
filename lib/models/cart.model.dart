import 'package:flutter/material.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/service.model.dart';

class Cart extends ChangeNotifier {
  List<SubService> services = [];

  List<SubService> get getServices {
    return services;
  }

  void addService(ShopService service) {
    services.add(SubService(id: "", service: service, date: DateTime.now()));
    notifyListeners();
  }

  void removeService(ShopService service) {
    services.remove(SubService(id: "", service: service, date: DateTime.now()));
    notifyListeners();
  }
}
