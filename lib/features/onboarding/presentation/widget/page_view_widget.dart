import 'package:expensetracker/core/constants/constant_assets.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/features/onboarding/domain/entity/onboarding_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageViewWidget extends StatelessWidget {
  final Function(int)? onPageChanged;
  final PageController controller;
  const PageViewWidget({
    super.key,
    required this.onPageChanged,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Expanded(
      child: PageView.builder(
        controller: controller,
        onPageChanged: (val) async{
          onPageChanged?.call(val);
        },
        itemCount: onboarding.length,
        itemBuilder: (context, index) {
          final data = onboarding[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(data.image),
              Text(
                data.title,
                style: textTheme.displaySmall,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              Text(
                data.des,
                style: textTheme.bodySmall!.copyWith(
                  color: AppColors.kPrimarylightColor,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}

List<Onboarding> onboarding = [
  Onboarding(
    image: Assets.image1,
    title: "Gain total control of your money",
    des: "Become your own money manager and make every cent count",
  ),
  Onboarding(
    image: Assets.image2,
    title: "Know where your money goes",
    des: "Track your transaction easily, with categories and financial report",
  ),
  Onboarding(
    image: Assets.image3,
    title: "Planning ahead",
    des: "Setup your budget for each category so you in control",
  ),
];
