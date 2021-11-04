import 'package:flutter/material.dart';
import 'package:userapp/widgets/general_indicator.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key? key, this.style = true}) : super(key: key);
  final bool style;

  @override
  Widget build(BuildContext context) {
    return GeneralIndicator(
      child: style ? const CircularProgressIndicator() : const Padding(padding: EdgeInsets.only(left: 16, right: 16), child: LinearProgressIndicator()),
    );
  }
}
