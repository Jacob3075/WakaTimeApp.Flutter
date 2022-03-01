import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_stats/history_list_item.dart";

class ProjectHistorySection {
  late final List<DailyProjectStats> filteredDailyProjectStats;

  ProjectHistorySection({required ProjectSummaries projectSummaries}) {
    filteredDailyProjectStats = projectSummaries.dailyProjectStats.reversed
        .toList()
        .where((it) => it.timeSpent.decimal != 0)
        .toList();
  }

  static Widget sectionHeader() => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "History",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14.h),
          ],
        ),
      );

  Widget historyListItem(int index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: HistoryListItem(
          dailyProjectStat: filteredDailyProjectStats[index],
        ),
      );
}
