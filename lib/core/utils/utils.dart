import 'package:intl/intl.dart';

String formatCurrency(double amount) {
  final formatter = NumberFormat.currency(
    locale: 'en_US', // You can change the locale based on your requirement
    symbol: '₦', // Currency symbol
    decimalDigits: 2, // Number of decimal places
  );

  return formatter.format(amount);
}
