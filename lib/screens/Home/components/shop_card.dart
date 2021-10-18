import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/screens/shopdetail/index.dart';
import 'package:userapp/services/sell_company.service.dart';

class ShopList extends StatelessWidget {
  const ShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SellCompany>>(
      future: fetchShops(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SizedBox(height: 80, child: Center(child: Text(snapshot.error.toString())));
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(height: 80, child: Center(child: CircularProgressIndicator()));
        }

        List<SellCompany> shops = snapshot.data ?? [];

        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              for (var i in shops) ShopCard(shop: i),
            ],
          ),
        );
      },
    );
  }
}

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key, required this.shop}) : super(key: key);
  final SellCompany shop;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        margin: const EdgeInsets.only(top: 8, bottom: 8),
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
                width: 95,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: NetworkImage("https://source.unsplash.com/random"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(6),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shop.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(thickness: 2, color: Colors.grey.shade200),
                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   child: Row(
                    //     children: [
                    //       for (var i = 0; i < 2; i++)
                    //         Chip(
                    //           padding: EdgeInsets.zero,
                    //           label: Text("Cate $i"),
                    //           backgroundColor: Colors.amberAccent,
                    //         ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, PageTransition(child: ShopDetail(shopInfo: shop), type: PageTransitionType.rightToLeftWithFade));
      },
    );
  }
}
