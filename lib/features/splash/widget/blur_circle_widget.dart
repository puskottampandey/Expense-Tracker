import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BlurCircleWidget extends StatelessWidget {
  const BlurCircleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40.h,
        width: 40.w,
        decoration: BoxDecoration(
          color: const Color(0xffFB52FF),
          borderRadius: const BorderRadius.all(Radius.circular(32)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xffFB52FF),
              blurRadius: 10.r,
              spreadRadius: 10.r,
            ),
          ],
        ),
      ),
    );
  }
}
