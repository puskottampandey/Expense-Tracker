import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      child: Column(
        children: [
          Text(text, style: textTheme.bodySmall),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
