import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:expensetracker/features/authentication/presentation/bloc/check_box_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckButtonText extends StatelessWidget {
  final String policytext;
  final String text;
  const CheckButtonText({
    super.key,
    required this.policytext,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Row(
      children: [
        BlocBuilder<CheckBoxBloc, bool>(
          builder: (context, state) {
            return Transform.scale(
              scale: 1.2,
              child: Checkbox(
                visualDensity: VisualDensity.compact,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                activeColor: AppColors.kPrimaryVoiletColor,
                value: state,
                onChanged: (bool? value) {
                  context.read<CheckBoxBloc>().checkTick();
                },
              ),
            );
          },
        ),
        Expanded(
          child: RichText(
            maxLines: 2,
            text: TextSpan(
              text: text,
              style: textTheme.labelLarge,
              children: [
                TextSpan(text: policytext, style: textTheme.labelLarge),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
