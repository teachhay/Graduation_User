import 'package:flutter/material.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail({Key? key}) : super(key: key);

  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
  List<String> shops = List.generate(30, (index) => "Shop - $index");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 200,
                    color: Colors.red,
                  ),
                ],
              ),
              for (var i = 0; i < 16; i++)
                Container(
                  margin: const EdgeInsets.only(top: 8, bottom: 8),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.accents[i],
                    // borderRadius: BorderRadius.circular(8),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
