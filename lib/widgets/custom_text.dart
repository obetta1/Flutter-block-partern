import 'package:auto_ch_tech_assesment/core/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';

class CustomTextWithBorder extends StatelessWidget {
  final String text;
  final double? fontSize;
  final Color? color;
  final Color? textcolor;
  final FontWeight? fontWeight;
  final double? bordderRadius;

  const CustomTextWithBorder(
      {Key? key,
      required this.text,
      this.fontSize,
      this.color,
      this.fontWeight,
      this.bordderRadius,
      this.textcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
      decoration: BoxDecoration(
        color: color ?? AppColors.purple,
        borderRadius: BorderRadius.circular(bordderRadius ?? 50.0),
        border: Border.all(color: AppColors.white, width: 2.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          backgroundColor: color ?? AppColors.purple,
          overflow: TextOverflow.ellipsis,
          color: textcolor ?? AppColors.white,
          fontSize: fontSize ?? 12.0,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
      ),
    );
  }
}
