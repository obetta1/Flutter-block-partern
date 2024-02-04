import 'package:auto_ch_tech_assesment/core/app_export.dart';
import 'package:auto_ch_tech_assesment/widgets/product_card.dart';
import 'package:flutter/material.dart';

class ProductCardCarousel extends StatelessWidget {
  const ProductCardCarousel({Key? key, required this.makes}) : super(key: key);

  final List<MakeList> makes;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: makes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: ProductCard(makes: makes[index]),
          );
        },
      ),
    );
  }
}
