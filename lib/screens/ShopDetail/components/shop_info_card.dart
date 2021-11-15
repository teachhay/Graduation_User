import 'package:flutter/material.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/category.model.dart';
import 'package:userapp/models/sell_company.model.dart';

class ShopInfoCard extends StatelessWidget {
  const ShopInfoCard({Key? key, required this.shop}) : super(key: key);
  final SellCompany shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 8,
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage("$fileUrl/${shop.logo}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shop.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(thickness: 2, color: Colors.grey.shade200),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (ShopCategory i in shop.categories)
                                  Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    child: Chip(label: Text(i.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w600)), backgroundColor: Colors.purpleAccent),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Expanded(
                        //   flex: 1,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: const [
                        //       Icon(Icons.star, size: 20),
                        //       SizedBox(width: 5),
                        //       Text("3.5 / 5", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardV1 extends StatelessWidget {
  const CardV1({
    Key? key,
    required this.shop,
  }) : super(key: key);

  final SellCompany shop;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 2,
            color: Colors.grey.shade200,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            shop.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (ShopCategory category in shop.categories)
                        Container(
                          margin: const EdgeInsets.only(right: 6),
                          child: Chip(
                            backgroundColor: Colors.red,
                            label: Text(
                              category.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.star),
                    Container(
                      margin: const EdgeInsets.only(left: 6),
                      child: const Text(
                        "(3.5)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
