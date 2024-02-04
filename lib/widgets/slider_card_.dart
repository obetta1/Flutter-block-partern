import 'package:auto_ch_tech_assesment/core/theme/app_colors.dart';
import 'package:auto_ch_tech_assesment/core/utils/utils.dart';
import 'package:auto_ch_tech_assesment/data/model/all_car_model.dart';
import 'package:auto_ch_tech_assesment/presentation/car_details/car_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'custom_buttons.dart';
import 'custom_text.dart';

class CardDouble extends StatelessWidget {
  final Function()? onTap;
  final Result? carList;
  const CardDouble({Key? key, required this.carList, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 400.0,
        child: IntrinsicHeight(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: 100.0,
                left: 20,
                right: 20,
                child: RoundedCard(
                  carList: carList!,
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width - 40,
                  height: 350.0,
                ),
              ),
              Positioned(
                top: 10.0,
                left: 30.0,
                right: 30.0,
                child: ImageRoundedCard(
                  color: AppColors.white,
                  width: MediaQuery.of(context).size.width - 55,
                  height: 250.0,
                  imageUrl: carList?.imageUrl,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageRoundedCard extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final String? imageUrl;

  const ImageRoundedCard({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipPath(
        clipper: ShapeBorderClipper(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl!,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          fit: BoxFit.fill,
          height: height - 20,
          width: width - 20,
        ),
      ),
    );
  }
}

class RoundedCard extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final Result carList;

  const RoundedCard({
    Key? key,
    required this.color,
    required this.width,
    required this.height,
    required this.carList,
  }) : super(key: key);

  String getMileageUnitString(MileageUnit mileageUnit) {
    String stringValue = mileageUnit.toStringValue();
    return stringValue.isNotEmpty
        ? stringValue[0].toUpperCase() + stringValue.substring(1)
        : stringValue;
  }

  String getFuelTypeString(FuelType fuelType) {
    String stringValue = fuelType.toStringValue();
    return stringValue.isNotEmpty
        ? stringValue[0].toUpperCase() + stringValue.substring(1)
        : stringValue;
  }

  String getTransmissionString(Transmission transmission) {
    String stringValue = transmission.toStringValue();
    return stringValue.isNotEmpty
        ? stringValue[0].toUpperCase() + stringValue.substring(1)
        : stringValue;
  }

  String getSellingConditionString(SellingCondition sellingCondition) {
    String stringValue = sellingCondition.toStringValue();
    return stringValue.isNotEmpty
        ? stringValue[0].toUpperCase() + stringValue.substring(1)
        : stringValue;
  }

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
              height: height / 2,
            ),
            _buildText(
                title: "${carList.year} ${carList.title!}",
                fontSize: 14,
                fontWeight: FontWeight.w900),
            Wrap(
              children: [
                CustomTextWithBorder(
                  text:
                      "${carList.mileage!}${getMileageUnitString(carList.mileageUnit!)}",
                ),
                CustomTextWithBorder(
                  text:
                      "${getTransmissionString(carList.transmission!)}  ${getFuelTypeString(carList.fuelType!)}",
                ),
                CustomTextWithBorder(
                  text: getSellingConditionString(carList.sellingCondition!),
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
                      CustomButton(
                        onPressed: () {
                          Get.to(CarDetailsScreen(carId: carList.id!));
                        },
                        text: 'Pay Cash',
                        color: AppColors.white,
                        borderColor: AppColors.black,
                      )
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
                      CustomButton(
                        color: AppColors.yellow,
                        onPressed: () {
                          Get.to(CarDetailsScreen(carId: carList.id!));
                        },
                        text: 'Buy On Loan',
                      )
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
