import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var i = 1; i < 16; i++)
            GestureDetector(
              child: Container(
                margin: const EdgeInsets.fromLTRB(6, 8, 6, 8),
                width: 100,
                decoration: BoxDecoration(
                  // color: Colors.accents[i],
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: -2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                      color: Colors.grey.shade300,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network("https://source.unsplash.com/random", fit: BoxFit.cover, width: 100, height: 100),
                    ),
                    Container(
                      margin: const EdgeInsets.all(6),
                      child: const Text(
                        "Service and Maintence",
                        textAlign: TextAlign.center,
                        // overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/categorydetail');
              },
            ),
        ],
      ),
    );
  }
}
