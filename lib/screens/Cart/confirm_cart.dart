import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/constants/functions.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/cart.model.dart';
import 'package:userapp/services/cart.service.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/custom_vertical_divider.dart';

class ConfirmCartScreen extends StatefulWidget {
  const ConfirmCartScreen({Key? key}) : super(key: key);

  @override
  _ConfirmCartScreenState createState() => _ConfirmCartScreenState();
}

class _ConfirmCartScreenState extends State<ConfirmCartScreen> {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: true);

    findSum() {
      return cart.getServices.map((item) => item.service.price).reduce((a, b) => a + b);
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Appointment Overview"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(14),
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Details",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CustomVerticalDivider(sizeBoxheight: 6, dividerThickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop name:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    "${cart.getShop?.name}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "From:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  Text(
                    "User 1",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
              const CustomVerticalDivider(sizeBoxheight: 6, dividerThickness: 2),
              const Text(
                "Services",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: cart.services.length,
                    itemBuilder: (context, index) {
                      return ServiceSubCard(subService: cart.getServices[index]);
                    },
                  );
                },
              ),
              // for (var i = 0; i < 20; i++) ServiceSubCard(i: i),
              const CustomVerticalDivider(sizeBoxheight: 6, dividerThickness: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Total:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "${findSum()}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, -2),
                blurRadius: 6,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 14, 10, 14),
            child: ElevatedButton(
              onPressed: () async {
                dynamic response = await createAppointment(shop: cart.getShop, subServices: cart.getServices);

                if (response != null) {
                  cart.reset();
                  Navigator.pushReplacementNamed(context, "/confirm");
                }
              },
              child: const Text("Confirm Appointment"),
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceSubCard extends StatelessWidget {
  const ServiceSubCard({Key? key, required this.subService}) : super(key: key);

  final SubService subService;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                subService.service.name,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    "${subService.date.day}/${subService.date.month}/${subService.date.year}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    "${displayLeadingZero(subService.date.hour.toInt())}:${displayLeadingZero(subService.date.minute.toInt())}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              )
            ],
          ),
          Text(
            "\$ ${subService.service.price}",
            style: const TextStyle(
              fontSize: 16,
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
