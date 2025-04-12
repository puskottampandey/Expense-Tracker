import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextAlignRight extends StatelessWidget {
  final String alignText;
  final void Function()? onTap;
  const TextAlignRight({super.key, required this.alignText, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: onTap,
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
