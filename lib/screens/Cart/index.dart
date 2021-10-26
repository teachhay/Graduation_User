import 'package:flutter/material.dart';
import 'package:userapp/widgets/appbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DateTime pickedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    _pickDate() async {
      DateTime? date = await showDatePicker(
        context: context,
        initialDate: DateTime(DateTime.now().year - 5),
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5),
      );

      if (date != null) {
        setState(() {
          pickedDate = date;
        });
      }
    }

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Cart Page"),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 8, right: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                padding: const EdgeInsets.all(15),
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Appointment Detail",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1.5,
                        color: Colors.black,
                      ),
                    ),
                    Divider(thickness: 3, color: Colors.white),
                    SizedBox(height: 3),
                    Text(
                      "Shop name",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Number of appointments",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      "Book by",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  const Divider(thickness: 2, color: Colors.black),
                  Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    margin: const EdgeInsets.only(left: 18),
                    padding: const EdgeInsets.fromLTRB(14, 0, 14, 0),
                    child: const Text(
                      "Appointment",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              ListTile(
                title: Chip(label: Text("${pickedDate.day} - ${pickedDate.month} - ${pickedDate.year}")),
                trailing: const Icon(Icons.keyboard_arrow_down),
                onTap: _pickDate,
              ),
              const SizedBox(height: 10),
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
