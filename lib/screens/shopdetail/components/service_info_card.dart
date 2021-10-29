import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/models/cart.model.dart';
import 'package:userapp/models/service.model.dart';
import 'package:userapp/services/service.service.dart';

class ServiceInfoCard extends StatelessWidget {
  const ServiceInfoCard({Key? key, required this.shopId}) : super(key: key);
  final String shopId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShopService>>(
      future: fetchServies(shopId),
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

            return Card(service: service);
          },
        );
      },
    );
  }
}

class Card extends StatelessWidget {
  const Card({Key? key, required this.service}) : super(key: key);
  final ShopService service;

  @override
  Widget build(BuildContext context) {
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
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false).addService(service);

                        Navigator.pop(context);
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
