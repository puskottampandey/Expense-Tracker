import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextWithOnPressed extends StatelessWidget {
  final void Function()? onTap;
  final String staticText;
  final String navigateText;
  const TextWithOnPressed({
    super.key,

    this.onTap,
    required this.staticText,
    required this.navigateText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          text: staticText,
          style: textTheme.labelSmall?.copyWith(
            color: AppColors.kverylightDarkColor,
          ),

          children: [TextSpan(text: navigateText, style: textTheme.labelSmall)],
        ),
      ),
    );
  }
}
