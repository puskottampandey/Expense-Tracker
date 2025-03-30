import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRoundButton extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  final bool isLoading;
  const CustomRoundButton({
    super.key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SizedBox(
      height: 40.h,
      child: Material(
        elevation: 5,
        color: AppColors.kPrimaryVoiletColor,
        borderRadius: BorderRadius.circular(16.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: isLoading ? null : onPressed,
          child: Container(
            height: 40.h,
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 14.w),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
            child: Center(
              child: Text(
                title,
                style: textTheme.labelLarge!.copyWith(
                  color: AppColors.kvverylightColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
