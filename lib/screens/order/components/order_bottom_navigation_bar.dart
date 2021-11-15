import 'package:flutter/material.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/services/appointment.service.dart';

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
                      Status status = Status(type: -1, date: DateTime.now());
                      appointment.status.insert(0, status);

                      final dynamic response = await cancelAppointment(appointment: appointment);

                      if (response is ErrorResponse) {
                        Navigator.pop(context, null);
                      }

                      if (response is PostResponse) {
                        PostResponse post = response;

                        if (post.meta == 200) {
                          return Future.delayed(const Duration(milliseconds: 500), () {
                            Navigator.of(context).pop(); // close cancel dialog
                            Navigator.of(context).pop(); // remove current route
                            return Navigator.pushReplacementNamed(context, '/order').then((value) => null); // return to previous route
                          });
                        }
                      }
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
