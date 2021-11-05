import 'package:flutter/material.dart';

class CustomInputLabel extends StatefulWidget {
  const CustomInputLabel({Key? key, required this.text, this.isUpdate = false}) : super(key: key);
  final String text;
  final bool isUpdate;

  @override
  _CustomInputLabelState createState() => _CustomInputLabelState();
}

class _CustomInputLabelState extends State<CustomInputLabel> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        color: widget.isUpdate ? Colors.black : Colors.black.withOpacity(0.6),
        fontSize: 16,
        letterSpacing: 1.5,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
