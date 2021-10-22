import 'package:flutter/material.dart';
import 'package:userapp/models/category.model.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/screens/home/components/shop_card.dart';
import 'package:userapp/services/sell_company.service.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/empty_data_indicator.dart';
import 'package:userapp/widgets/loading_indicator.dart';

class DetailByCategory extends StatefulWidget {
  const DetailByCategory({Key? key, required this.category}) : super(key: key);
  final ShopCategory category;

  @override
  _DetailByCategoryState createState() => _DetailByCategoryState();
}

class _DetailByCategoryState extends State<DetailByCategory> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> query = {
      "categories": widget.category.id.toString(),
    };

    return Scaffold(
      appBar: const CustomAppBar(
        title: Text("Category Detail"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                child: Column(
                  children: [
                    Text(widget.category.name),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 10),
              for (var i = 0; i < 20; i++)
                Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              // FutureBuilder<List<SellCompany>>(
              //   future: fetchShops(query: query),
              //   builder: (context, snapshot) {
              //     if (snapshot.hasError) {
              //       return Center(child: SizedBox(height: 100, child: Center(child: Text(snapshot.error.toString()))));
              //     }

              //     if (snapshot.connectionState != ConnectionState.done) {
              //       return const LoadingIndicator();
              //     }

              //     List<SellCompany> shops = snapshot.data ?? [];

              //     if (shops.isNotEmpty) {
              //       return SingleChildScrollView(
              //         scrollDirection: Axis.vertical,
              //         child: Column(
              //           children: [
              //             for (var i in shops) ShopCard(shop: i),
              //           ],
              //         ),
              //       );
              //     }

              //     return const EmptyDataIndicator(message: "No shops exist in this category");
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class V1 extends StatelessWidget {
  const V1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Category Detail",
                style: TextStyle(color: Colors.black),
              ),
              background: SizedBox(
                height: 80,
                child: Image.network("https://source.unsplash.com/random", fit: BoxFit.cover),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              for (var i = 1; i < 16; i++)
                Container(
                  color: Colors.accents[i],
                  height: 100,
                  width: double.infinity,
                ),
            ]),
          )
        ],
      ),
    );
  }
}
