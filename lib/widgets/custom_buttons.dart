import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final Color? borderColor;

  const CustomButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 1, color: borderColor ?? Colors.white),
          primary: color, // You can set the background color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            // Set the border radius
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.black, // Set the text color
            fontSize: 12.0, // Set the text size
          ),
        ),
      ),
    );
  }
}
