import 'package:flutter/material.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/category.model.dart';
import 'package:userapp/models/sell_company.model.dart';
import 'package:userapp/screens/home/components/shop_card.dart';
import 'package:userapp/services/sell_company.service.dart';
import 'package:userapp/widgets/appbar.dart';
import 'package:userapp/widgets/empty_data_indicator.dart';
import 'package:userapp/widgets/general_indicator.dart';
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
                      flex: 3,
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.fromLTRB(6, 6, 0, 6),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.category.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(thickness: 2, color: Colors.grey.shade200),
                            Flexible(
                              child: Text(
                                widget.category.remark,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 95,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: NetworkImage(widget.category.image == "" ? "https://via.placeholder.com/150" : "$fileUrl/${widget.category.image}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(thickness: 2),
              FutureBuilder<dynamic>(
                future: fetchShops(query: query),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: SizedBox(height: 100, child: Center(child: Text(snapshot.error.toString()))));
                  }

                  if (snapshot.connectionState != ConnectionState.done) {
                    return const LoadingIndicator();
                  }

                  final dynamic response = snapshot.data;

                  if (response.meta == 200) {
                    List<SellCompany> shops = response.results ?? [];

                    if (shops.isEmpty) {
                      return const GeneralIndicator(child: EmptyDataIndicator(message: "No shops exist in this category"));
                    }

                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          for (var i in shops) ShopCard(shop: i),
                        ],
                      ),
                    );
                  }

                  return Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text(
                      "Error occurred - ${response.message}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                },
              ),
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
