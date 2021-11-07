import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/constants/config.dart';
// import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/cart.model.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/custom_vertical_divider.dart';

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
        title: Text("Appointments List"),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                padding: const EdgeInsets.all(15),
                // height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                  // boxShadow: [
                  //   BoxShadow(
                  //     offset: const Offset(0, 2),
                  //     blurRadius: 4,
                  //     color: Colors.black.withOpacity(0.2),
                  //   ),
                  // ],
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
                    const CustomVerticalDivider(sizeBoxheight: 3),
                    SectionDetail(title: "Shop name:", value: cart.getShop!.name),
                    SectionDetail(title: "# of appointments:", value: "${cart.getServices.length}"),
                    SectionDetail(title: "Book by:", value: "${userinfo!.firstName} ${userinfo!.lastName}"),
                  ],
                ),
              ),
              const SizedBox(height: 4),
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
              const SizedBox(height: 8),
              //FIXME bug when remove services from the list
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
                // List<SubService> services = Provider.of<Cart>(context, listen: false).getServices;

                // for (SubService item in services) {
                //   print("${item.service.name} at ${item.date}");
                // }

                Navigator.pushNamed(context, "/confirmcart");
              },
              child: const Text("Make Appointment"),
            ),
          ),
        ),
      ),
    );
  }
}

class SectionDetail extends StatelessWidget {
  const SectionDetail({Key? key, this.title = "Placeholder title", this.value = "Placeholder value"}) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
