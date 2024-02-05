import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:intl/intl.dart';

import '../theme/app_colors.dart';

String formatCurrency(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_US', // You can change the locale based on your requirement
    symbol: '₦', // Currency symbol
    decimalDigits: 2, // Number of decimal places
  );

  return formatter.format(amount);
}

Widget showProgressBar() {
  return CircularProgressIndicator.adaptive(
    strokeWidth: 4,
    valueColor: AlwaysStoppedAnimation<Color>(
      AppColors.purple,
    ),
  );
}

void showSnackbar(String title, String message) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 15),
      backgroundColor: AppColors.purple,
      colorText: Colors.white);
}
