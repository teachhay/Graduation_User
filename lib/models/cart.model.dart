import 'package:flutter/material.dart';
import 'package:userapp/models/appointment.model.dart';

class Cart extends ChangeNotifier {
  Appointment appointment = Appointment.init();

  Appointment get getAppointment {
    return appointment;
  }

  void addAppointment(Appointment appointment) {
    appointment = appointment;
    notifyListeners();
  }

  void addSubService(SubService subService) {
    appointment.services.add(subService);
    notifyListeners();
  }

  void removeSubService(SubService subService) {
    appointment.services.remove(subService);
    notifyListeners();
  }
}
