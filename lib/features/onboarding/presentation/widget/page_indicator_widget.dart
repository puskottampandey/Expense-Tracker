import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorWidget extends StatelessWidget {
  final PageController controller;
  final int length;
  const PageIndicatorWidget(this.controller, this.length, {super.key});

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: length,
      effect: WormEffect(
        activeDotColor: AppColors.kPrimaryVoiletColor,
        dotColor: AppColors.kvveryViloetlightColor,
      ),
    );
  }
}
