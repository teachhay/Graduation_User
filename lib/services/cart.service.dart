import 'dart:convert';

import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/models/user.model.dart';

Future<dynamic> createAppointment({SellCompany? shop, List<SubService>? subServices, User? user, String remark = ""}) async {
  try {
    Map<String, dynamic> data = {
      "sellCompany": shop!.id,
      "userId": "61445de53e57b9c71d2c90ce",
      "services": subServices!.map((item) {
        return {
          "id": item.id ?? "",
          "service": item.service.id,
          "date": item.date!.toIso8601String(),
        };
      }).toList(),
      "status": [
        {"date": "2021-10-04T02:22:39.602+00:00", "type": 1}
      ],
      "remark": remark,
    };
    ApiManager request = ApiManager();
    PostResponse response = await request.postApiCall("appointment", data);

    if (response.meta == 201) {
      return response;
    }

    return null;
  } catch (e) {
    return ErrorResponse.fromJson(jsonDecode(jsonEncode(e)));
  }
}
