// import 'package:expensetracker/core/theme/app_colors.dart';
// import 'package:flutter/material.dart';

// TextTheme textTheme = TextTheme(
//   headlineLarge: TextStyle(
//     fontFamily: "poppins",
//     fontWeight: FontWeight.bold,
//     fontSize: 64,
//     color: AppColors.kPrimaryDarkColor,
//   ),
//   headlineSmall: const TextStyle(fontSize: 13, fontFamily: "poppins"),
//   titleLarge: const TextStyle(
//     fontFamily: "poppins",
//     fontSize: 32,
//     fontWeight: FontWeight.bold,
//   ),
//   titleMedium: const TextStyle(fontSize: 24, fontFamily: "poppins"),
//   titleSmall: const TextStyle(fontFamily: "poppins", fontSize: 18),
//   bodyLarge: const TextStyle(fontFamily: "poppins", fontSize: 16),
//   bodyMedium: const TextStyle(fontFamily: "poppins", fontSize: 14),
//   bodySmall: const TextStyle(fontFamily: "poppins", fontSize: 12),
// );

import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    fontFamily: "poppins",
    scaffoldBackgroundColor: AppColors.kvverylightColor,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.bold,
        fontSize: 32.sp,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      displayMedium: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.w600,
        fontSize: 28.sp,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      displaySmall: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.normal,
        fontSize: 18.sp,
        height: 1.5,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.normal,
        fontSize: 16.sp,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      labelLarge: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.bold,
        fontSize: 14.sp,
        height: 1.3,
        letterSpacing: 0.4,
      ),
      labelSmall: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        height: 1.4,
        letterSpacing: 1.5,
      ),
    ),
  );

  // Dark theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkModeBackground,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.black,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32.0,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      displayMedium: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
        fontSize: 28.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      displaySmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
        height: 1.5,
        letterSpacing: 0.25,
      ),
      bodySmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      labelLarge: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
        height: 1.3,
        letterSpacing: 0.4,
      ),
      labelSmall: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w400,
        fontSize: 10.0,
        height: 1.4,
        letterSpacing: 1.5,
      ),
    ),
  );
}
