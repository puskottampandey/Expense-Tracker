import 'package:expensetracker/core/constants/constant_assets.dart';
import 'package:expensetracker/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final listday = ["Today", "Week", "Month", "Year"];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(16.w, 40.h, 16.w, 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(32.r)),
              gradient: AppColors.containergradient,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 22.r,
                      backgroundColor: AppColors.kPrimaryVoiletColor,
                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: AppColors.kvverylightColor,
                        child: CircleAvatar(
                          radius: 18.r,
                          backgroundImage:
                              Image.asset(Assets.profileImage).image,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.h,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.kwhitelightColor),
                        borderRadius: BorderRadius.circular(32.r),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColors.kPrimaryVoiletColor,
                            ),
                          ),
                          Text(
                            "October",
                            style: textTheme.bodyLarge!.copyWith(
                              fontSize: AppColors.regular2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active,
                          color: AppColors.kPrimaryVoiletColor,
                          size: 24.h,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  "Account Balance",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: AppColors.regular2,
                    color: AppColors.kPrimarylightColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Rs. 90000",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: AppColors.title0,
                    color: AppColors.kPrimaryDarkColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    rowContainer(
                      color: AppColors.kPrimaryGreenColor,
                      image: Assets.incomeLogo,
                      text: "Income",
                      number: "Rs. 12000",
                    ),
                    rowContainer(
                      color: AppColors.kPrimaryRedColor,
                      image: Assets.expenseLogo,
                      text: "Expense",
                      number: "Rs. 12000",
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Spend Frequency",
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: AppColors.title3,
                        color: AppColors.kPrimaryDarkColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Text(
                  "",
                  style: textTheme.bodyLarge!.copyWith(
                    fontSize: AppColors.title3,
                    color: AppColors.kPrimaryDarkColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8.h),
                lineChart(),
                SizedBox(height: 8.h),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recent Transaction",
                      style: textTheme.bodyLarge!.copyWith(
                        fontSize: AppColors.title3,
                        color: AppColors.kPrimaryDarkColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.h,
                        horizontal: 16.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kvveryViloetlightColor,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        "See All",
                        style: textTheme.bodyLarge!.copyWith(
                          fontSize: AppColors.regular3,
                          color: AppColors.kPrimaryVoiletColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                listTransaction(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ListView listTransaction() {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (BuildContext context, index) {
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            decoration: BoxDecoration(
              color: _getColor(index),
              borderRadius: BorderRadius.circular(16.r),
            ),
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
            child: Icon(
              Icons.badge,
              color: AppColors.kPrimaryYellowColor,
              size: 26.sp,
            ),
          ),
          title: Text(
            "Shopping",
            style: textTheme.bodyLarge!.copyWith(
              fontSize: AppColors.regular2,
              color: AppColors.kseconadaryDarkColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Text(
              "Buy some vegetables",
              style: textTheme.bodyLarge!.copyWith(
                fontSize: AppColors.regular3,
                color: AppColors.kPrimarylightColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "-Rs.200",
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: AppColors.regular2,
                  color: AppColors.kPrimaryRedColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "10:00 Am",
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: AppColors.regular3,
                  color: AppColors.kPrimarylightColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView listContainer(List<String> listday, int currentIndex) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listday.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 16.w),
            margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
            decoration:
                currentIndex == index
                    ? BoxDecoration(
                      color:
                          currentIndex == index
                              ? AppColors.kverylightYellowColor
                              : AppColors.kseconadarylightColor,
                      borderRadius: BorderRadius.circular(16.r),
                    )
                    : null,
            child: Center(
              child: Text(
                listday[index],
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: AppColors.regular3,
                  color:
                      currentIndex == index
                          ? AppColors.kPrimaryYellowColor
                          : AppColors.kverylightDarkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  AspectRatio lineChart() {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
        LineChartData(
          borderData: FlBorderData(show: false),
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: const [
                FlSpot(1, 1000),
                FlSpot(4, 200),
                FlSpot(6, 1000),
                FlSpot(8, 500),
                FlSpot(10, 300),
              ],
              isCurved: true,
              barWidth: 4.w,
              shadow: const Shadow(color: AppColors.kPrimaryVoiletColor),
              color: AppColors.kPrimaryVoiletColor,
              curveSmoothness: 0.2,
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                color: AppColors.klightVioletColor,
                show: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(int index) {
    switch (index) {
      case 0:
        AppColors.kPrimaryBlueColor;
        break;
      case 1:
        AppColors.kPrimaryGreenColor;
        break;
      case 2:
        AppColors.kPrimaryGreenColor;
        break;
      default:
        AppColors.kPrimaryVoiletColor;
    }
    return AppColors.kPrimaryGreenColor;
  }

  Container rowContainer({
    Color? color,
    String? image,
    String? text,
    String? number,
  }) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(28.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColors.kvverylightColor,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: SvgPicture.asset(
              image!,
              colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text!,
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: AppColors.regular2,
                  color: AppColors.kvverylightColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                number!,
                style: textTheme.bodyLarge!.copyWith(
                  fontSize: AppColors.title3,
                  color: AppColors.kvverylightColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
