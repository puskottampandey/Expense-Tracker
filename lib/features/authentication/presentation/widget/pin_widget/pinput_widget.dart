import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/features/authentication/presentation/bloc/pin_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinputWidget extends StatelessWidget {
  const PinputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PinBloc, String>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            bool isFilled = index < state.length;
            return Container(
              margin: EdgeInsets.symmetric(vertical: 40.h, horizontal: 10.w),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                shape: BoxShape.circle,
              ),
              child: isFilled ? Text(state[index].toString()) : Text(""),
            );
          }),
        );
      },
    );
  }
}
