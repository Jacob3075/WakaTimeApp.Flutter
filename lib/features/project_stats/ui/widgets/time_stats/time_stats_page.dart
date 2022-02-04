import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/stats_card.dart";
import "package:waka_time_app/common/ui/widgets/stats_chip.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_stats/project_history_section.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_stats/time_spent_on_project_chart.dart";

class TimeStatsPage extends StatelessWidget {
  final ProjectSummaries projectSummaries;

  const TimeStatsPage({Key? key, required this.projectSummaries}) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            TimeSpentOnProjectChart(
              stats: projectSummaries.dailyProjectStats,
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  _summaryStats(),
                  ProjectHistorySection(projectSummaries: projectSummaries),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _summaryStats() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            StatsCard.valueAsText(
              gradient: AppGradients.primary,
              text: "Total Time\nSpent",
              valueText: projectSummaries.totalTime.formattedPrint(),
              icon: AppAssets.icons.time,
              cardHeight: 65.h,
              borderRadius: BorderRadius.circular(16.r),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: StatsChip(
                    title: "Average Time",
                    value: projectSummaries.averageTime.formattedPrint(),
                    gradient: AppGradients.orangeYellow,
                    icon: AppAssets.icons.time,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                SizedBox(width: 24.w),
                Expanded(
                  child: StatsChip(
                    title: "Days worked On",
                    value: projectSummaries.daysWorked.formattedPrint(),
                    gradient: AppGradients.redPurple,
                    // TODO: ADD ICON FOR CALENDAR/DATEs
                    icon: AppAssets.icons.time,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
