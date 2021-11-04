import 'package:flutter/material.dart';

class GeneralIndicator extends StatelessWidget {
  const GeneralIndicator({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 1.5,
      child: Center(
        child: child,
      ),
    );
  }
}
