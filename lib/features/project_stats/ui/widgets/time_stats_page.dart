import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/stats_card.dart";
import "package:waka_time_app/common/ui/widgets/stats_chip.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_spent_on_project_chart.dart";

class TimeStatsPage extends StatelessWidget {
  final Summaries projectStats;

  const TimeStatsPage({Key? key, required this.projectStats}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TimeSpentOnProjectChart(
            stats: projectStats.dailyStats,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                StatsCard(
                  gradient: AppGradients.primary,
                  text: "Total Time\nSpent",
                  value: projectStats.totalTime.formattedPrint(),
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
                        value: "4H, 7M",
                        gradient: AppGradients.orangeYellow,
                        icon: AppAssets.icons.time,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    SizedBox(width: 36.w),
                    Expanded(
                      child: StatsChip(
                        title: "Days worked On",
                        value: "1M, 3D",
                        gradient: AppGradients.redPurple,
                        icon: AppAssets.icons.time,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );
}
