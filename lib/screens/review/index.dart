import 'package:flutter/material.dart';
import 'package:userapp/widgets/appbar.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key}) : super(key: key);

  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text("Review Page"),
      ),
      body: Center(
        child: Text("Review Page"),
      ),
    );
  }
}
