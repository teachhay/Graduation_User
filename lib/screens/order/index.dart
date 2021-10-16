import 'package:flutter/material.dart';
import 'package:userapp/widgets/appbar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        title: Text("Order Page"),
      ),
      body: Center(
        child: Text("Order Page"),
      ),
    );
  }
}
