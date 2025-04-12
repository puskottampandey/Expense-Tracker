import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/features/authentication/presentation/bloc/pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRowDeleteWrap extends StatelessWidget {
  const TextRowDeleteWrap({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return BlocBuilder(
      builder: (context, index) {
        return Row(
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
        );
      },
    );
  }
}
