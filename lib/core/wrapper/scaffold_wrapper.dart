import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaffoldWrapper extends StatelessWidget {
  final Widget body;
  final String title;
  const ScaffoldWrapper({super.key, required this.body, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (canPop, value) {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          // leading: InkWell(
          //   onTap: () {
          //     context.pop();
          //   },
          //   child: Container(
          //     color: AppColors.kvverylightColor,
          //     child: Icon(Icons.arrow_back_ios),
          //   ),
          // ),
          title: Text(title, style: textTheme.bodySmall),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
          child: body,
        ),
      ),
    );
  }
}
