import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white60,
    scaffoldBackgroundColor: Colors.white60,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: Colors.grey.shade400,
      selectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      selectedLabelStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    fontFamily: AppFont.dmSansRegular,
    brightness: Brightness.dark,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: AppColors.purple,
      selectedItemColor: Colors.white,
      backgroundColor: Colors.black,
      selectedLabelStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      unselectedLabelStyle:
          const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
}
