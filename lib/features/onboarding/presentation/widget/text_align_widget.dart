import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextAlignRight extends StatelessWidget {
  final String alignText;
  const TextAlignRight({super.key, required this.alignText});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          context.go(Routes.loginScreen);
        },
        child: Text(
          alignText,
          style: textTheme.labelLarge!.copyWith(
            color: AppColors.kPrimaryDarkColor,
          ),
        ),
      ),
    );
  }
}
