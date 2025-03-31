import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/widget/button/custom_round_button.dart';
import 'package:expensetracker/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:expensetracker/features/onboarding/presentation/widget/page_indicator_widget.dart';
import 'package:expensetracker/features/onboarding/presentation/widget/page_view_widget.dart';
import 'package:expensetracker/features/settings/presentation/bloc/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  PageController controller = PageController(initialPage: 0);
  int pageChangeIndex = 0;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: BlocBuilder<OnboardingBloc, int>(
            builder: (context, state) {
              return Column(
                children: [
                  // pageview
                  PageViewWidget(
                    controller: controller,
                    onPageChanged: (val) {
                      context.read<OnboardingBloc>().currentPage(val);
                    },
                  ),
                  SizedBox(height: 10.h),

                  // page indicator
                  PageIndicatorWidget(controller, onboarding.length),

                  SizedBox(height: 50.h),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: CustomRoundButton(
                      title: state == 2 ? "Sign Up" : "Continue",
                      onPressed: () {
                        if (state == 2) {
                        } else {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        }
                      },
                    ),
                  ),
                  state == 2
                      ? Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomRoundButton(
                          backgroundColor: AppColors.kvveryViloetlightColor,
                          textColor: AppColors.kPrimaryVoiletColor,
                          title: "Login",
                          onPressed: () {},
                        ),
                      )
                      : SizedBox(height: 52.h),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
