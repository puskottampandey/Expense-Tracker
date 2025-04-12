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
        statusBarColor: AppColors.kPrimaryVoiletColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.bold,
        fontSize: 28.sp,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      displayMedium: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.w600,
        fontSize: 26.sp,
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
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      labelLarge: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        height: 1.3,
      ),
      labelSmall: TextStyle(
        color: AppColors.kPrimaryDarkColor,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        height: 1.4,
      ),
    ),
  );

  // Dark theme
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    fontFamily: "poppins",
    scaffoldBackgroundColor: AppColors.darkModeBackground,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.kPrimaryVoiletColor,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: AppColors.kverywhitelightColor,
        fontWeight: FontWeight.bold,
        fontSize: 28.sp,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      displayMedium: TextStyle(
        color: AppColors.kverywhitelightColor,
        fontWeight: FontWeight.w600,
        fontSize: 26.sp,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      displaySmall: TextStyle(
        color: AppColors.kverywhitelightColor,
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      bodyLarge: TextStyle(
        color: AppColors.kverywhitelightColor,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: AppColors.kverywhitelightColor,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
        height: 1.5,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        color: AppColors.kverywhitelightColor,
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
        height: 1.4,
        letterSpacing: 0.5,
      ),
      labelLarge: TextStyle(
        color: AppColors.kverywhitelightColor,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
        height: 1.3,
      ),
      labelSmall: TextStyle(
        color: AppColors.kverywhitelightColor,
        fontWeight: FontWeight.w500,
        fontSize: 12.sp,
        height: 1.4,
      ),
    ),
  );
}
