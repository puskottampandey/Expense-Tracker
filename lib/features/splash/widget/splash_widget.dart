import 'package:expensetracker/core/navigation/navigation_service.dart';
import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/theme/app_theme.dart' show textTheme;
import 'package:expensetracker/features/splash/widget/blur_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlurCircleWidget(),
        Center(
          child: Text(
            "Expense Tracker",
            style: textTheme.bodyLarge!.copyWith(
              fontSize: 32.sp,
              fontWeight: FontWeight.bold,
              color: kvverylightColor,
            ),
          ),
        ),
      ],
    );
  }
}
