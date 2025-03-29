import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaddingWrapper extends StatelessWidget {
  final Widget child;

  final double horizontalPadding;
  final double verticalPadding;

  const PaddingWrapper({
    super.key,
    required this.child,
    this.horizontalPadding = 20,
    this.verticalPadding = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding.w,
        vertical: verticalPadding.h,
      ),
      child: child,
    );
  }
}
