import 'package:flutter/material.dart';
import 'package:userapp/constants/functions.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/services/appointment.service.dart';
import 'package:userapp/widgets/appbar.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({Key? key, required this.appointment}) : super(key: key);
  final Appointment appointment;

  @override
  _OrderDetailScreenState createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  late Appointment appointment;

  @override
  void initState() {
    super.initState();
    appointment = widget.appointment;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Order Detail"),
      ),
      body: Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Appointment Detail",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(thickness: 2, color: Colors.grey),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Shop name: "),
                        Text(appointment.sellCompany.name),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Order date:"),
                        Text("${appointment.createdAt!.month}/${appointment.createdAt!.day}/${appointment.createdAt!.year} \t ${displayLeadingZero(appointment.createdAt!.hour)}:${displayLeadingZero(appointment.createdAt!.minute)}"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("From:"),
                        //ignore: todo
                        //TODO replace with userinfo
                        Text("User 1"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Status:"),
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
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Divider(thickness: 2, color: Colors.black),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    margin: const EdgeInsets.only(left: 18),
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: const Text(
                      "Services",
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
              for (SubService subService in appointment.services) OrderDetailServiceCard(subService: subService),
            ],
          ),
        ),
      ),
      bottomNavigationBar: appointment.status[0].type == 1 ? OrderDetailBottomNavigationBar(appointment: appointment) : null,
    );
  }
}

class OrderDetailBottomNavigationBar extends StatelessWidget {
  const OrderDetailBottomNavigationBar({Key? key, required this.appointment}) : super(key: key);
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, -4),
            blurRadius: 6,
            color: Colors.grey.shade300,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () async {
          bool? option = false;

          option = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                // title: const Text('Are you sure you want to cancel the appointment?'),
                content: const Text(
                  'Are you sure you want to cancel the appointment?',
                  style: TextStyle(
                    height: 1.5,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () async {
                      //ignore: todo
                      //TODO update appointment status to cancel
                      Status status = Status(type: 0, date: DateTime.now());

                      appointment.status.insert(0, status);

                      final dynamic response = await cancelAppointment(appointment: appointment);

                      if (response is ErrorResponse) {
                        Navigator.pop(context, null);
                      }

                      if (response is PostResponse) {
                        PostResponse post = response;

                        if (post.meta == 200) {
                          return Future.delayed(const Duration(seconds: 0), () => Navigator.pop(context, true));
                        }
                      }

                      // Future.delayed(const Duration(seconds: 5), () => Navigator.pop(context, true));
                    },
                    child: const Text('Yes'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text(
                      'No',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              );
            },
          );

          if (option == true) {
            Navigator.pop(context, true);
          }
        },
        child: const Text("Cancel Appointment"),
      ),
    );
  }
}

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
              Text("${subService.date!.month}/${subService.date!.day}/${subService.date!.year} \t ${displayLeadingZero(subService.date!.hour)}:${displayLeadingZero(subService.date!.minute)}"),
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
