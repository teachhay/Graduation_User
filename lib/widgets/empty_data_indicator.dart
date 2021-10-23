import 'package:flutter/material.dart';

class EmptyDataIndicator extends StatelessWidget {
  const EmptyDataIndicator({Key? key, this.message = "No data"}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 0),
        TextButton(onPressed: () => Navigator.pop(context), child: const Text("Go back")),
      ],
    );
  }
}
