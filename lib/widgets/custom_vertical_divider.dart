import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({Key? key, this.sizeBoxheight = 3, this.dividerThickness = 2, this.dividerColor = Colors.black}) : super(key: key);

  final double sizeBoxheight;
  final double dividerThickness;
  final Color dividerColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: sizeBoxheight),
        Divider(thickness: dividerThickness, color: dividerColor),
        SizedBox(height: sizeBoxheight),
      ],
    );
  }
}
