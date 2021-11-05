import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:page_transition/page_transition.dart';
import 'package:userapp/constants/functions.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/screens/order/order_detail.dart';

class OrderHistoryCard extends StatelessWidget {
  const OrderHistoryCard({Key? key, required this.appointment}) : super(key: key);

  final Appointment appointment;

  findSum() {
    return appointment.services.map((item) => item.service.price).reduce((a, b) => a + b);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(12),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 4,
              color: Colors.grey.shade300,
            ),
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  appointment.sellCompany.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text("${appointment.services.length} services"),
                const SizedBox(height: 8),
                Text("${appointment.createdAt!.month}/${appointment.createdAt!.day}/${appointment.createdAt!.year} \t ${displayLeadingZero(appointment.createdAt!.hour)}:${displayLeadingZero(appointment.createdAt!.minute)}"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Chip(
                  backgroundColor: displayStatusType(type: appointment.status[0].type)["color"],
                  label: Text(
                    displayStatusType(type: appointment.status[0].type)["value"],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  "\$ ${findSum()}",
                  style: TextStyle(
                    color: Colors.green.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => OrderDetailScreen(appointment: appointment)));
        // Navigator.push(context, PageTransition(child: OrderDetailScreen(appointment: appointment), type: PageTransitionType.size, alignment: Alignment.bottomCenter));
      },
    );
  }
}
