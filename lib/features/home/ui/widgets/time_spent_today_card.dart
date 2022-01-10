import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";

class TimeSpentTodayCard extends StatelessWidget {
  final DailyStats? _dailyStats;

  const TimeSpentTodayCard({Key? key, required DailyStats? dailyStats})
      : _dailyStats = dailyStats,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72.h,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [AppGradients.primary.startColor, AppGradients.primary.endColor],
        ),
        boxShadow: const [AppShadows.cardShadow],
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Time Spent\nToday",
                  style: TextStyle(fontSize: 16.sp),
                ),
                Text(
                  _dailyStats?.timeSpent.formattedPrint() ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            child: SvgPicture.asset(
              AppAssets.icons.time,
              height: 72.h,
              width: 72.h,
            ),
            left: 100.h,
          ),
        ],
      ),
    );
  }
}
