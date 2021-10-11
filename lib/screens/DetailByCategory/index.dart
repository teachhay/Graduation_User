import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailByCategory extends StatefulWidget {
  const DetailByCategory({Key? key}) : super(key: key);

  @override
  _DetailByCategoryState createState() => _DetailByCategoryState();
}

class _DetailByCategoryState extends State<DetailByCategory> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.grey.shade400));

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
