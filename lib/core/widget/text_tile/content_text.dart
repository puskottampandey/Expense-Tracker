import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContentText extends StatelessWidget {
  final String title;
  final Color color;
  const ContentText({
    super.key,
    required this.title,
    this.color = AppColors.kPrimaryVoiletColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Column(
      children: [
        Text(title, style: textTheme.labelSmall!.copyWith(color: color)),
        SizedBox(height: 10.h),
      ],
    );
  }
}
