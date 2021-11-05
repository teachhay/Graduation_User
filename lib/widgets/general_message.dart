import 'package:flutter/material.dart';

class GeneralMessage extends StatelessWidget {
  const GeneralMessage({Key? key, this.message = "Placeholder message"}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Text(
        message,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
