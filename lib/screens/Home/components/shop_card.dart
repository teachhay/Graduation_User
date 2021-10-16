import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:userapp/models/sell_company.model.dart';
import "package:userapp/constants/api.dart";

class ShopCard extends StatelessWidget {
  const ShopCard({Key? key, required this.sellCompany}) : super(key: key);
  final SellCompany sellCompany;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.grey.shade400,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0,
                blurRadius: 6,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          width: double.infinity,
          height: 180,
          child: Row(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(sellCompany.name),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    height: double.infinity,
                    width: double.infinity,
                    // child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   // child: Image.network("$fileUrl/${sellCompany.logo}"),
                    //   child: CachedNetworkImage(
                    //     imageUrl: "$fileUrl/${sellCompany.logo}",
                    //     placeholder: (context, url) => const CircularProgressIndicator(),
                    //     errorWidget: (context, url, error) => const Icon(Icons.error),
                    //   ),
                    // ), //FIXME check if image doesnt exist, show placeholder
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, "/shopdetail");
      },
    );
  }
}
