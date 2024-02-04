import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../data/model/car_details_model.dart';
import '../../widgets/custom_text.dart';

class CarSpecTile extends StatelessWidget {
  final CarDetailsModel carDetails;

  const CarSpecTile({super.key, required this.carDetails});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: 450,
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
            fontSize: 18,
            fontWeight: FontWeight.w900,
            textcolor: AppColors.black,
            color: AppColors.white,
            text: 'Car Spec',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 20),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 8.0,
              children: [
                CustomTextWithBorder(
                  color: AppColors.purple,
                  text: "${carDetails.mileage!}${carDetails.mileageUnit!}",
                ),
                CustomTextWithBorder(
                  color: AppColors.purple,
                  text: "${carDetails.carFeatures}  ${carDetails.fuelType!}",
                ),
                CustomTextWithBorder(
                  color: AppColors.purple,
                  text: carDetails.sellingCondition!,
                ),
                CustomTextWithBorder(
                  color: AppColors.purple,
                  text: carDetails.ccMeasurement.toString(),
                ),
                CustomTextWithBorder(
                  color: AppColors.purple,
                  text: carDetails.engineType!,
                ),
              ],
            ),
          ),
          _buildCarSpaceTile(
            width: width,
            spec: 'Engine Type',
            value: "${carDetails.engineType!}",
          ),
          _buildCarSpaceTile(
            width: width,
            spec: 'Fuel Type',
            value: "${carDetails.fuelType!}",
          ),
          _buildCarSpaceTile(
            width: width,
            spec: 'Transmission',
            value: "${carDetails.transmission!}",
          ),
          _buildCarSpaceTile(
            width: width,
            spec: 'Interior Color',
            value: "${carDetails.bodyType?.name!}",
          ),
          _buildCarSpaceTile(
            width: width,
            spec: 'Vin',
            value: carDetails.vin!,
          ),
          _buildCarSpaceTile(
            width: width,
            spec: 'Vehicle Id',
            value: "${carDetails.id!}",
          ),
        ],
      ),
    );
  }

  Widget _buildCarSpaceTile(
      {required double width, required String spec, required String value}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomTextWithBorder(
                fontSize: 14,
                textcolor: AppColors.black,
                color: AppColors.white,
                text: spec,
              ),
              CustomTextWithBorder(
                fontSize: 14,
                color: AppColors.white,
                textcolor: AppColors.black,
                text: value,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Container(
            width: width / 1.3,
            height: 0.5,
            color: AppColors.grey,
          ),
        )
      ],
    );
  }
}
