import 'package:flutter/foundation.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/request.model.dart';

Future<List<Appointment>> fetchAppointments() async {
  final api = ApiManager();
  final response = await api.getsApiCall("appointment");
  Future<List<Appointment>> appointments = compute(parseAppointments, response["results"]);

  return appointments;
}
