import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextTapped extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const TextTapped({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return GestureDetector(
      onTap: onTap,
      child: Text(text, style: textTheme.labelSmall),
    );
  }
}
