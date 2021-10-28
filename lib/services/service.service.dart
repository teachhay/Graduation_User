import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/cart.model.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/service.model.dart';

Future<List<ShopService>> fetchServies(String shopId) async {
  final api = ApiManager();
  final response = await api.getsApiCall("service?sellCompany=$shopId");

  return compute(parseServices, response["results"]);
}

void addServiceToAppointment(BuildContext context, ShopService service) {
  Provider.of<Cart>(context, listen: false).addSubService(SubService.fromService(service));
}
