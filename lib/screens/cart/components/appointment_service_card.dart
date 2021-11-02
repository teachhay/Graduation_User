import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/constants/functions.dart';
import 'package:userapp/models/appointment.model.dart';
import 'package:userapp/models/cart.model.dart';

class AppointmentServiceCard extends StatefulWidget {
  const AppointmentServiceCard({Key? key, required this.subService, required this.callback}) : super(key: key);
  final SubService subService;
  final Function callback;

  @override
  _AppointmentServiceCardState createState() => _AppointmentServiceCardState();
}

class _AppointmentServiceCardState extends State<AppointmentServiceCard> {
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  late SubService subService;
  late Function callback;

  @override
  void initState() {
    super.initState();
    subService = widget.subService;
    callback = widget.callback;
  }

  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context, listen: true);

    _pickDate() async {
      DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(DateTime.now().year + 50),
      );

      if (date != null) {
        setState(() {
          pickedDate = date;
          subService.date = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
        });

        callback(subService);
      }
    }

    _pickTime() async {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          pickedTime = time;
          subService.date = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
        });

        callback(subService);
      }
    }

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(16),
          // height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 6,
                color: Colors.black.withOpacity(0.2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    subService.service.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$ ${subService.service.price.toString()}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Date:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      OutlinedButton(
                        child: Text(
                          "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: _pickDate,
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Time:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      OutlinedButton(
                        child: Text(
                          "${displayLeadingZero(pickedTime.hour)}:${displayLeadingZero(pickedTime.minute)} ${pickedTime.period.index == 0 ? 'AM' : 'PM'}",
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: _pickTime,
                        style: TextButton.styleFrom(
                          primary: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            child: const Icon(
              Icons.cancel,
              size: 25,
              color: Colors.red,
            ),
            onTap: () {
              cart.removeSubService(subService);

              // if (cart.getServices.isEmpty) {
              //   Navigator.pop(context);
              // }
            },
          ),
        ),
      ],
    );
  }
}
