import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_staggered_animations/flutter_staggered_animations.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/stats_card.dart";
import "package:waka_time_app/common/ui/widgets/stats_chip.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_stats/project_history_section.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_stats/time_spent_on_project_chart.dart";

class TimeStatsPage extends StatefulWidget {
  final ProjectSummaries projectSummaries;

  const TimeStatsPage({Key? key, required this.projectSummaries}) : super(key: key);

  @override
  State<TimeStatsPage> createState() => _TimeStatsPageState();
}

class _TimeStatsPageState extends State<TimeStatsPage> with AutomaticKeepAliveClientMixin {
  late final ProjectHistorySection projectHistorySection;
  late final List<DailyProjectStats> filteredDailyProjectStats;

  @override
  void initState() {
    super.initState();
    filteredDailyProjectStats =
        ProjectHistorySection.getFilteredProjectStats(widget.projectSummaries);

    projectHistorySection =
        ProjectHistorySection(filteredDailyProjectStats: filteredDailyProjectStats);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return AnimationLimiter(
      child: ListView.builder(
        itemCount: filteredDailyProjectStats.length + 4,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
          duration: const Duration(milliseconds: 1000),
          position: index,
          child: SlideAnimation(
            verticalOffset: ScreenUtil().screenHeight,
            child: _getItemToDisplayForIndex(index),
          ),
        ),
      ),
    );
  }

  Widget _getItemToDisplayForIndex(int index) {
    switch (index) {
      case 0:
        return _chart();
      case 1:
        return _totalTimeCard();
      case 2:
        return _statsChipsRow();
      case 3:
        return ProjectHistorySection.sectionHeader();
      default:
        return projectHistorySection.historyListItem(index - 4);
    }
  }

  Widget _chart() => Column(
        children: [
          TimeSpentOnProjectChart(
            stats: widget.projectSummaries.dailyProjectStats,
          ),
          SizedBox(height: 20.h),
        ],
      );

  Column _totalTimeCard() => Column(
        children: [
          StatsCard.valueAsText(
            gradient: AppGradients.primary,
            text: "Total Time\nSpent",
            valueText: widget.projectSummaries.totalTime.formattedPrint(),
            icon: AppAssets.icons.time,
            cardHeight: 65.h,
            borderRadius: BorderRadius.circular(16.r),
          ),
          SizedBox(height: 24.h),
        ],
      );

  Column _statsChipsRow() => Column(
        children: [
          _statsChips(),
          SizedBox(height: 24.h),
        ],
      );

  Row _statsChips() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: StatsChip(
              title: "Average Time",
              value: widget.projectSummaries.averageTime.formattedPrint(),
              gradient: AppGradients.orangeYellow,
              icon: AppAssets.icons.time,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
          SizedBox(width: 24.w),
          Expanded(
            child: StatsChip(
              title: "Days worked On",
              value: widget.projectSummaries.daysWorked.formattedPrint(),
              gradient: AppGradients.redPurple,
              // TODO: ADD ICON FOR CALENDAR/DATEs
              icon: AppAssets.icons.time,
              borderRadius: BorderRadius.circular(12.r),
            ),
          ),
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
