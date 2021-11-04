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
//REWORK logic needs rework
    Map<String, dynamic> data = {
      "sellCompany": appointment.sellCompany.id,
      "userId": appointment.userId.id,
      "services": appointment.services.map((item) {
        return {
          "id": item.id ?? "",
          "service": item.service.id,
          "date": item.date!.toIso8601String(),
        };
      }).toList(),
      "status": appointment.status.map((item) {
        return {
          "type": item.type,
          "date": item.date.toIso8601String(),
        };
      }).toList(),
      "remark": appointment.remark,
      "isActive": appointment.isActive,
    };

    final ApiManager api = ApiManager();
    PostResponse response = await api.putApiCall("appointment/${appointment.id}", data);

    if (response.meta == 200) {
      return response;
    }

    return null;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}
