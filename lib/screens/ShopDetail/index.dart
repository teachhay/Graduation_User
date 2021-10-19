import 'package:flutter/material.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/screens/shopdetail/components/shop_info_card.dart';
import 'components/service_info_card.dart';

class ShopDetail extends StatefulWidget {
  const ShopDetail({Key? key, required this.shopInfo}) : super(key: key);
  final SellCompany shopInfo;

  @override
  _ShopDetailState createState() => _ShopDetailState();
}

class _ShopDetailState extends State<ShopDetail> {
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
            ShopInfoCard(shop: widget.shopInfo),
            const SizedBox(height: 0),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Divider(thickness: 2, indent: 12, endIndent: 12, color: Colors.grey.shade200),
                Container(
                  margin: const EdgeInsets.only(left: 35),
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  color: Colors.transparent,
                  child: Text(
                    "Services",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, backgroundColor: Theme.of(context).scaffoldBackgroundColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ServiceInfoCard(shopId: widget.shopInfo.id),
          ],
        ),
      ),
    );
  }
}
