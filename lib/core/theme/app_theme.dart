import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

TextTheme textTheme = const TextTheme(
  headlineLarge: TextStyle(
    fontFamily: "poppins",
    fontWeight: FontWeight.bold,
    fontSize: 64,
    color: kseconadaryDarkColor,
  ),
  headlineSmall: TextStyle(fontSize: 13, fontFamily: "poppins"),
  titleLarge: TextStyle(
    fontFamily: "poppins",
    fontSize: 32,
    fontWeight: FontWeight.bold,
  ),
  titleMedium: TextStyle(fontSize: 24, fontFamily: "poppins"),
  titleSmall: TextStyle(fontFamily: "poppins", fontSize: 18),
  bodyLarge: TextStyle(fontFamily: "poppins", fontSize: 16),
  bodyMedium: TextStyle(fontFamily: "poppins", fontSize: 14),
  bodySmall: TextStyle(fontFamily: "poppins", fontSize: 12),
);
