import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/cart.model.dart';
import 'package:userapp/widgets/appbar.dart';

import 'components/appointment_service_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: true);

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Cart Page"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                padding: const EdgeInsets.all(15),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Appointment Detail",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    const Divider(thickness: 3, color: Colors.white),
                    const SizedBox(height: 3),
                    Text(
                      "Shop name - ${cart.getShop?.name}",
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Number of appointments",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      "Book by",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Divider(thickness: 2, color: Colors.black),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    margin: const EdgeInsets.only(left: 18),
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: const Text(
                      "Appointment",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const ScrollPhysics(),
                    itemCount: cart.services.length,
                    itemBuilder: (context, index) {
                      return AppointmentServiceCard(subService: cart.services[index], callback: (val) => cart.services[index] = val);
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              // for (SubService item in Provider.of<Cart>(context, listen: true).services) AppointmentServiceCard(subService: item, callback: (val) => item = val),
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
              onPressed: () {
                List<SubService> services = Provider.of<Cart>(context, listen: false).getServices;

                for (SubService item in services) {
                  print(item.service.name);
                }

                // Navigator.pushNamed(context, "/confirmcart");
              },
              child: const Text("Make Appointment"),
            ),
          ),
        ),
      ),
    );
  }
}
