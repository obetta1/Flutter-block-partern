import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/custom_text.dart';

class CarFeatureTile extends StatelessWidget {
  final List feature;
  const CarFeatureTile({super.key, required this.feature});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: 400,
      width: width - 30,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey,
            offset: Offset(0.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Column(
        children: [
          CustomTextWithBorder(
              textcolor: AppColors.darkgrey,
              color: AppColors.grey,
              text: 'feature[index].toString()'),
          Wrap(
              spacing: 10.0,
              runSpacing: 8.0,
              children: List.generate(feature.length, (index) {
                return CustomTextWithBorder(
                  textcolor: AppColors.darkgrey,
                  color: AppColors.grey,
                  text: feature[index].toString(),
                );
              })),
        ],
      ),
    );
  }
}
