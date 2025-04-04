import 'package:expensetracker/core/constants/constant_assets.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoundButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;

  final bool isLoading;
  const CustomRoundButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.backgroundColor = AppColors.kPrimaryVoiletColor,
    this.textColor = AppColors.kvverylightColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 0.h),
        child: Material(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(32.r),
          child: InkWell(
            borderRadius: BorderRadius.circular(32.r),
            onTap: isLoading ? null : onPressed,
            child: Container(
              height: 40.h,
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 14.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Center(
                child: Text(
                  title,
                  style: textTheme.labelLarge!.copyWith(color: textColor),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
