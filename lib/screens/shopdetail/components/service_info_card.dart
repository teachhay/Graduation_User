import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/models/cart.model.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/models/service.model.dart';
import 'package:userapp/services/service.service.dart';

class ServiceInfoCard extends StatelessWidget {
  const ServiceInfoCard({Key? key, required this.shop}) : super(key: key);
  final SellCompany shop;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShopService>>(
      future: fetchServices(shop.id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SizedBox(height: 80, child: Center(child: Text(snapshot.error.toString())));
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.5,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        List<ShopService> services = snapshot.data ?? [];

        return ListView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: services.length,
          itemBuilder: (context, index) {
            ShopService service = services[index];

            return CardContainer(service: service, shop: shop);
          },
        );
      },
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({Key? key, required this.service, required this.shop}) : super(key: key);
  final ShopService service;
  final SellCompany shop;

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: true);

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          context: context,
          builder: (context) {
            return Container(
              padding: const EdgeInsets.fromLTRB(14, 20, 14, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          service.name,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "\$ ${service.price}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Divider(thickness: 2),
                  const SizedBox(height: 5),
                  Text(
                    service.remark,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        bool? option = false;

                        if (cart.getShop == null) {
                          cart.setShop(shop);
                        }

                        if (cart.getShop?.id != shop.id) {
                          option = await showDialog<bool>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Confirm to replace'),
                                content: const Text('You had services from other shop. Do you want to replace them?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, false),
                                    child: const Text('No'),
                                  ),
                                  TextButton(
                                    onPressed: () => Navigator.pop(context, true),
                                    child: const Text('Yes'),
                                  ),
                                ],
                              );
                            },
                          );
                        }

                        if (option == true) {
                          cart.clearServices();
                          cart.setShop(shop);
                          cart.addService(service);

                          Navigator.pop(context);
                          return;
                        }

                        if (cart.getShop?.id == shop.id && option == false) {
                          cart.addService(service);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text("Add to Appointment"),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Container(
        height: 80,
        margin: const EdgeInsets.only(bottom: 6),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              color: Colors.grey.shade300,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                service.name,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              "\$ ${service.price}",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
