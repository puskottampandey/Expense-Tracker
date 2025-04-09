import 'package:expensetracker/core/constants/constant_assets.dart';
import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/widget/button/custom_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ConfirmWidget extends StatelessWidget {
  const ConfirmWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.confirmLogo),
              Text("Your email is on the way", style: textTheme.bodyLarge),
              SizedBox(height: 20.h),
              Text(
                "Check your email test@test.com and follow the instructions to reset your password",
                maxLines: 3,
                textAlign: TextAlign.center,
                style: textTheme.labelLarge!.copyWith(
                  color: AppColors.kPrimarylightColor,
                ),
              ),
              SizedBox(height: 50.h),
              CustomRoundButton(
                title: "Continue",
                onPressed: () {
                  context.go(Routes.resetScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
