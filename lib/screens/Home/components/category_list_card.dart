import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:userapp/constants/api.dart';
import 'package:userapp/models/category.model.dart';
import 'package:userapp/screens/detailbycategory/index.dart';
import 'package:userapp/services/category.service.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ShopCategory>>(
      future: fetchCategories(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return SizedBox(height: 80, child: Center(child: Text(snapshot.error.toString())));
        }

        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox(height: 80, child: Center(child: CircularProgressIndicator()));
        }

        List<ShopCategory> categories = snapshot.data ?? [];

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i in categories) CategoryCard(category: i),
            ],
          ),
        );
      },
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({Key? key, required this.category}) : super(key: key);
  final ShopCategory category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.fromLTRB(6, 8, 6, 8),
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              offset: const Offset(0, 2),
              color: Colors.grey.shade300,
            ),
          ],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(category.image != "" ? "$fileUrl/${category.image}" : "https://via.placeholder.com/150", fit: BoxFit.cover, width: 100, height: 100),
            ),
            Container(
              margin: const EdgeInsets.all(6),
              child: Text(
                category.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, PageTransition(child: const DetailByCategory(), type: PageTransitionType.rightToLeftWithFade));
      },
    );
  }
}
