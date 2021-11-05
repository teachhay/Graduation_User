import 'package:flutter/material.dart';
import 'package:userapp/constants/functions.dart';
import 'package:userapp/models/appointment.model.dart';

class OrderDetailServiceCard extends StatelessWidget {
  const OrderDetailServiceCard({Key? key, required this.subService}) : super(key: key);
  final SubService subService;

  @override
  Widget build(BuildContext context) {
    // ListView.builder(
    //       shrinkWrap: true,
    //       physics: const ScrollPhysics(),
    //       itemCount: appointments.length,
    //       itemBuilder: (context, index) {
    //         Appointment appointment = appointments[index];

    //         return OrderHistoryCard(appointment: appointment);
    //       },
    //     );

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(subService.service.name),
              const SizedBox(height: 10),
              Text("${subService.date.month}/${subService.date.day}/${subService.date.year} \t ${displayLeadingZero(subService.date.hour)}:${displayLeadingZero(subService.date.minute)}"),
            ],
          ),
          Text(
            "\$ ${subService.service.price}",
            style: TextStyle(
              color: Colors.green.shade600,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
