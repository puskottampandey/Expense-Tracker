import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/features/splash/widget/blur_circle_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  _navigator(String route) async {
    context.go(route);
  }

  @override
  void initState() async {
    super.initState();
    await Future.delayed(const Duration(seconds: 2)).then((value) async {
      _navigator(Routes.onboardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: AppColors.kPrimaryVoiletColor,
      body: Stack(
        children: [
          BlurCircleWidget(),
          Center(
            child: Text(
              "Expense Tracker",
              style: textTheme.displayLarge!.copyWith(
                color: AppColors.kvverylightColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
