import 'package:flutter/material.dart';
import 'package:userapp/widgets/appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Cart Page"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              for (var i = 0; i < 5; i++)
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 0),
                        blurRadius: 6,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
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
              onPressed: () => Navigator.pushNamed(context, "/confirmcart"),
              child: const Text("Make Appointment"),
            ),
          ),
        ),
      ),
    );
  }
}
