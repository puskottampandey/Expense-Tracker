import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/features/authentication/presentation/bloc/pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRowNumberWrap extends StatelessWidget {
  const TextRowNumberWrap({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return BlocBuilder<PinBloc, String>(
      builder: (context, state) {
        return Wrap(
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
        );
      },
    );
  }
}
