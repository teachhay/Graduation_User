import 'package:flutter/material.dart';
import 'package:userapp/models/request.model.dart';
import 'package:userapp/models/response.model.dart';
import 'package:userapp/widgets/appbar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Order Page"),
      ),
      body: Container(
        margin: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Order Page"),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                ApiManager request = ApiManager();
                Map<String, dynamic> data = {
                  "id": 12,
                  "name": "teachhay",
                  "age": 21,
                };

                PostResponse response = await request.postApiCall("test", data);

                print(response.data);
              },
              child: const Text("Post"),
            ),
          ],
        ),
      ),
    );
  }
}
