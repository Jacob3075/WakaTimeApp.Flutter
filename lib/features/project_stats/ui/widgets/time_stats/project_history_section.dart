import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_stats/history_list_item.dart";

class ProjectHistorySection extends StatefulWidget {
  final ProjectSummaries projectSummaries;

  const ProjectHistorySection({Key? key, required this.projectSummaries}) : super(key: key);

  @override
  State<ProjectHistorySection> createState() => _ProjectHistorySectionState();
}

class _ProjectHistorySectionState extends State<ProjectHistorySection> {
  bool _filtered = true;
  late final List<DailyProjectStats> allDailyProjectStats;
  late final List<DailyProjectStats> filteredDailyProjectStats;

  List<DailyProjectStats> get dailyProjectStats =>
      _filtered ? filteredDailyProjectStats : allDailyProjectStats;

  @override
  void initState() {
    super.initState();

    allDailyProjectStats = widget.projectSummaries.dailyProjectStats.reversed.toList();
    filteredDailyProjectStats =
        allDailyProjectStats.where((it) => it.timeSpent.decimal != 0).toList();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "History",
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    color: _filtered ? AppColors.accentIcons : Colors.white,
                  ),
                  iconSize: 30.r,
                  constraints: const BoxConstraints(),
                  onPressed: _toggleFilteredState,
                  padding: EdgeInsets.zero,
                  splashRadius: 28.r,
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: _historyList(),
            ),
          ],
        ),
      );

  /// [Source](https://stackoverflow.com/a/58725480/13181948) for list view inside column
  Widget _historyList() => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: dailyProjectStats.length,
        itemBuilder: (context, index) => HistoryListItem(
          dailyProjectStat: dailyProjectStats[index],
        ),
      );

  void _toggleFilteredState() => setState(() => _filtered = !_filtered);
}
