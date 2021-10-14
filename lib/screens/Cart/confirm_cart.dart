import 'package:flutter/material.dart';
import 'package:userapp/widgets/appbar.dart';

class ConfirmCartScreen extends StatefulWidget {
  const ConfirmCartScreen({Key? key}) : super(key: key);

  @override
  _ConfirmCartScreenState createState() => _ConfirmCartScreenState();
}

class _ConfirmCartScreenState extends State<ConfirmCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Confirm Page"),
      ),
      body: Container(
        height: 200,
        decoration: const BoxDecoration(color: Colors.amberAccent),
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
              onPressed: () => Navigator.pushReplacementNamed(context, "/confirm"),
              child: const Text("Confirm Appointment"),
            ),
          ),
        ),
      ),
    );
  }
}
