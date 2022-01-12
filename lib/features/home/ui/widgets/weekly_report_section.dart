import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/features/home/domain/models/last_7_days_stats.dart";
import "package:waka_time_app/features/home/ui/widgets/weekly_report_graph.dart";

class WeeklyReportSection extends StatelessWidget {
  final Last7DaysStats last7DaysStats;

  const WeeklyReportSection({Key? key, required this.last7DaysStats}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            _buildSectionHeader(),
            SizedBox(height: 12.h),
            _buildChart(),
          ],
        ),
      );

  Widget _buildSectionHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Weekly Report",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Details",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.accentText,
            ),
          )
        ],
      );

  Widget _buildChart() => Container(
        width: double.infinity,
        height: 250.h,
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36.r),
          color: AppColors.cardBGPrimary,
          boxShadow: const [AppShadows.cardShadow],
        ),
        child: WeeklyReportGraph(last7daysStats: last7DaysStats),
      );
}
