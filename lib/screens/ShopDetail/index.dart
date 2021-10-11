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
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            title: Text("Shop Detail"),
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              // Container(
              //   height: 200,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //   ),
              // ),
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

class V1 extends StatelessWidget {
  const V1({
    Key? key,
    required this.shops,
  }) : super(key: key);

  final List<String> shops;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              for (var item in shops)
                Container(
                  margin: const EdgeInsets.all(8),
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 2),
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                      )
                    ],
                  ),
                  child: Center(
                    child: Text(item),
                  ),
                )
            ]),
          )
        ],
      ),
    );
  }
}
