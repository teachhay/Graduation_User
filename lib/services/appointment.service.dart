import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';

Future<dynamic> fetchAppointments({Map<String, dynamic>? query}) async {
  try {
    final ApiManager api = ApiManager();
    GetsResponse response;

    if (query != null) {
      response = await api.getsApiCall("appointment", params: query);
    } else {
      response = await api.getsApiCall("appointment");
    }

    if (response.meta == 200) {
      return compute(parseAppointments, response.results);
    }

    return null;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}

Future<dynamic> cancelAppointment({required Appointment appointment}) async {
  try {
    final ApiManager api = ApiManager();
    PostResponse response = await api.putApiCall("appointment/${appointment.id}", appointment);

    if (response.meta == 200) {
      return response;
    }

    return null;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}
