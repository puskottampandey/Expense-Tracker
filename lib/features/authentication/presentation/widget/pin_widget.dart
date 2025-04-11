import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinWidget extends StatefulWidget {
  const PinWidget({super.key});

  @override
  State<PinWidget> createState() => _PinWidgetState();
}

class _PinWidgetState extends State<PinWidget> {
  final TextEditingController pinController = TextEditingController();
  final _pinKey = GlobalKey<FormState>();
  List<int> pinList = [];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Scaffold(
      backgroundColor: AppColors.kPrimaryVoiletColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: ListView(
            children: [
              Center(
                child: Text(
                  "Let’s  setup your PIN",
                  style: textTheme.bodySmall!.copyWith(
                    color: AppColors.kverywhitelightColor,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 40.h,
                      horizontal: 10.w,
                    ),
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      pinList.isEmpty ? " " : pinList[index].toString(),
                    ),
                  );
                }),
              ),
              SizedBox(height: 100.h),
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 30.h,
                spacing: 60.w,
                children: List.generate(9, (int index) {
                  return TextButton(
                    onPressed: () {
                      pinList.add(index + 1);
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
                      pinList.add(0);
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
                      if (pinList.isNotEmpty) {
                        pinList.clear();
                      }
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
          ),
        ),
      ),
    );
  }
}
