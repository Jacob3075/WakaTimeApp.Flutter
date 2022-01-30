import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_stats/history_list_item.dart";

class ProjectHistorySection extends StatelessWidget {
  final ProjectSummaries projectSummaries;

  const ProjectHistorySection({Key? key, required this.projectSummaries}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            Text(
              "History",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            _historyList(),
          ],
        ),
      );

  /// [Source](https://stackoverflow.com/a/58725480/13181948) for list view inside column
  Widget _historyList() => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: projectSummaries.dailyProjectStats.length,
        itemBuilder: (context, index) => HistoryListItem(
          dailyProjectStat: projectSummaries.dailyProjectStats[index],
        ),
      );
}
