import 'package:flutter/material.dart';
import 'package:userapp/models/category.model.dart';
import 'package:userapp/models/sell_company.model.dart';

class ShopInfoCard extends StatelessWidget {
  const ShopInfoCard({Key? key, required this.shop}) : super(key: key);
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
