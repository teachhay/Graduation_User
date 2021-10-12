import 'package:flutter/material.dart';
import 'package:userapp/screens/ShopDetail/components/shop_info_card.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail({Key? key}) : super(key: key);

  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class Service {
  String? name;
  int? price;

  Service(_name, _price) {
    price = _price;
    name = _name;
  }
}

class _ShopDetailState extends State<ShopDetail> {
  List<Service> services = List.generate(10, (index) => Service("Service ${index + 1}", index * 2 + index));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shop Detail"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ShopInfoCard(),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Divider(
                  thickness: 2,
                  indent: 12,
                  endIndent: 12,
                  color: Colors.grey.shade200,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 35),
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  color: Colors.white,
                  child: const Text(
                    "Servies",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            for (var item in services)
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(14, 20, 14, 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                print(item.name);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Text(
                                      item.name.toString(),
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "\$ ${item.price.toString()}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text("Add to Appointment"),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 80,
                  margin: const EdgeInsets.only(bottom: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        spreadRadius: 0,
                        color: Colors.grey.shade300,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          item.name.toString(),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "\$ ${item.price.toString()}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
