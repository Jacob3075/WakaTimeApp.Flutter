import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/stats_for_duration.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/features/home/ui/widgets/weekly_report_graph.dart";

class WeeklyReportSection extends StatelessWidget {
  final StatsForDuration statsForDuration;

  const WeeklyReportSection({Key? key, required this.statsForDuration}) : super(key: key);

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
        child: WeeklyReportGraph(statsForDuration: statsForDuration),
      );
}
