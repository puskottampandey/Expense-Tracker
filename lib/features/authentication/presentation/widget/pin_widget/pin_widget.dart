import 'package:expensetracker/core/route/constant_route.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/core/widget/loader/loading_overlay.dart';
import 'package:expensetracker/features/authentication/presentation/bloc/pin_bloc.dart';
import 'package:expensetracker/features/authentication/presentation/widget/pin_widget/pinput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class PinWidget extends StatefulWidget {
  const PinWidget({super.key});

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  bool checkLoadingStatus = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return LoadingOverlay(
      isLoading: checkLoadingStatus,
      child: Scaffold(
        backgroundColor: AppColors.kPrimaryVoiletColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            child: BlocConsumer<PinBloc, String>(
              listener: (context, state) async {
                if (state.length == 4) {
                  setState(() {
                    checkLoadingStatus = true;
                  });
                  await Future.delayed(Duration(seconds: 5));
                  setState(() {
                    checkLoadingStatus = false;
                  });
                  // ignore: use_build_context_synchronously
                  context.push(Routes.loginScreen);
                }
              },
              builder: (context, state) {
                return ListView(
                  children: [
                    Center(
                      child: Text(
                        "Let’s  setup your PIN",
                        style: textTheme.bodySmall!.copyWith(
                          color: AppColors.kverywhitelightColor,
                        ),
                      ),
                    ),
                    PinputWidget(),
                    SizedBox(height: 100.h),

                    Wrap(
                      alignment: WrapAlignment.center,
                      runSpacing: 30.h,
                      spacing: 60.w,
                      children: List.generate(9, (int index) {
                        return TextButton(
                          onPressed: () {
                            int total = index + 1;
                            context.read<PinBloc>().pinAdd(total.toString());
                          },
                          child: Text(
                            "${index + 1}",
                            style: textTheme.displayLarge!.copyWith(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kverywhitelightColor,
                            ),
                          ),
                        );
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(onPressed: null, child: SizedBox()),
                        TextButton(
                          onPressed: () {
                            context.read<PinBloc>().pinAdd(0.toString());
                          },
                          child: Text(
                            "0",
                            style: textTheme.displayLarge!.copyWith(
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kverywhitelightColor,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context.read<PinBloc>().pinremove();
                          },
                          child: Icon(
                            size: 40.sp,
                            Icons.backspace,
                            color: AppColors.backgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
