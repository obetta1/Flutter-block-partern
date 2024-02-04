import 'package:auto_ch_tech_assesment/core/theme/app_colors.dart';
import 'package:auto_ch_tech_assesment/core/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../core/utils/image_constant.dart';
import 'custom_image_view.dart';

class CustomSearchField extends StatelessWidget {
  final double width;
  final double height;
  final Function(String)? onSubmitted;

  const CustomSearchField({
    Key? key,
    this.width = 300.0,
    this.height = 50.0,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: 20,
        ),
        Container(
          width: width / 1.4,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 2.0),
                blurRadius: 4.0,
              ),
            ],
          ),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  size: 40,
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: TextField(
                  onSubmitted: onSubmitted,
                  style: TextStyle(color: Colors.black, fontSize: 24),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          width: 50,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(6.0),
            border: Border.all(
              color: Colors.white24, // White border color
              width: 2.0,
            ),
          ),
          child: Icon(
            Icons.edit,
            color: AppColors.yellow,
          ),
        )
      ],
    );
  }
}
