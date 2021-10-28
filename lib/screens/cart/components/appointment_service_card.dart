import 'package:flutter/material.dart';
import 'package:userapp/models/appointment.model.dart';

class AppointmentServiceCard extends StatefulWidget {
  const AppointmentServiceCard({Key? key, required this.appointment, required this.callback}) : super(key: key);
  final Appointment appointment;
  final Function callback;

  @override
  _AppointmentServiceCardState createState() => _AppointmentServiceCardState();
}

class _AppointmentServiceCardState extends State<AppointmentServiceCard> {
  DateTime pickedDate = DateTime.now();
  TimeOfDay pickedTime = TimeOfDay.now();
  late Appointment appointment;
  late Function callback;

  @override
  void initState() {
    super.initState();
    appointment = widget.appointment;
    callback = widget.callback;
  }

  @override
  Widget build(BuildContext context) {
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
          // appointment.date = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
        });

        callback(appointment);
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
          // appointment.date = DateTime(pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
        });

        callback(appointment);
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsets.all(16),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade400,
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
          // Text(appointment.service.service.name),
          Row(
            children: [
              TextButton(
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
              TextButton(
                child: Text(
                  "${pickedTime.hour}:${pickedTime.minute} ${pickedTime.period.index == 0 ? 'AM' : 'PM'}",
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
          )
        ],
      ),
    );
  }
}
