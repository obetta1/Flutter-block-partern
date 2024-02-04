import 'package:auto_ch_tech_assesment/data/model/car_details_model.dart';
import 'package:auto_ch_tech_assesment/presentation/car_details/car_media_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../core/theme/app_colors.dart';
import '../../core/utils/utils.dart';
import '../../data/model/all_car_model.dart';
import '../../widgets/custom_buttons.dart';
import '../../widgets/custom_text.dart';

///this is used for display the car image on the details screen
class CarDetailImageCard extends StatelessWidget {
  final double width;
  final double height;
  final CarDetailsModel carDetails;

  const CarDetailImageCard({
    Key? key,
    required this.width,
    required this.height,
    required this.carDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: width,
          height: height / 2,
          child: CachedNetworkImage(
            imageUrl: carDetails.imageUrl!,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            fit: BoxFit.cover,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: CustomButton(
            color: AppColors.yellow,
            onPressed: () {
              Get.to(CarMediaScreen(carId: carDetails.id!));
            },
            text: 'View Car Media',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWithBorder(
                  color: AppColors.white,
                  textcolor: AppColors.black,
                  text: "${carDetails.year} ${carDetails.carName!}",
                  fontSize: 14,
                  fontWeight: FontWeight.w900),
              Wrap(
                children: [
                  CustomTextWithBorder(
                    color: AppColors.purple,
                    text: "${carDetails.mileage!}${carDetails.mileageUnit!}",
                  ),
                  CustomTextWithBorder(
                    color: AppColors.purple,
                    text: "${carDetails.transmission}  ${carDetails.fuelType!}",
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
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextWithBorder(
                    textcolor: AppColors.darkgrey,
                    color: AppColors.white,
                    text: "Vehicle ID:  ${carDetails.id} ",
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28.0),
                    child: SizedBox(
                      width: 20,
                      child: Text('|'),
                    ),
                  ),
                  CustomTextWithBorder(
                    textcolor: AppColors.darkgrey,
                    color: AppColors.white,
                    text: "${carDetails.city!},  ${carDetails.state!}",
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                        title: formatCurrency(
                            carDetails.marketplacePrice!.toDouble()),
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                          title:
                              "${formatCurrency(carDetails.installment!.toDouble())}/Mon",
                          fontSize: 14,
                          color: AppColors.blue),
                      SizedBox(
                        height: 10,
                      ),
                      _buildText(
                          title: "30% Down Payment",
                          fontSize: 10,
                          color: AppColors.darkgrey),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: 30,
          width: width,
          color: AppColors.grey,
        )
      ],
    );
  }

  Widget _buildText({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    required String title,
  }) {
    String displayedText =
        title.length > 20 ? title.substring(0, 15) + '...' : title;

    return Text(
      displayedText,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}

class CarDetailTile extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final CarDetailsModel carList;

  const CarDetailTile({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
    required this.carList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: height,
            ),
            _buildText(
                title: "${carList.year} ${carList.carName!}",
                fontSize: 14,
                fontWeight: FontWeight.w900),
            Wrap(
              children: [
                CustomTextWithBorder(
                  text: "${carList.mileage!}${carList.mileageUnit!}",
                ),
                CustomTextWithBorder(
                  text: "${carList.transmission}  ${carList.fuelType!}",
                ),
                CustomTextWithBorder(
                  text: carList.sellingCondition!,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                        title: formatCurrency(
                            carList.marketplacePrice!.toDouble()),
                        fontSize: 14,
                      ),
                      _buildText(
                          title: "${carList.city} ${carList.state} ",
                          fontSize: 10,
                          color: AppColors.grey),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildText(
                          title:
                              "${formatCurrency(carList.installment!.toDouble())}/Mon",
                          fontSize: 14,
                          color: AppColors.blue),
                      _buildText(
                          title: "30% Down Payment",
                          fontSize: 10,
                          color: AppColors.grey),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildText({
    double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    required String title,
  }) {
    String displayedText =
        title.length > 20 ? title.substring(0, 15) + '...' : title;

    return Text(
      displayedText,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 14.0,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}
