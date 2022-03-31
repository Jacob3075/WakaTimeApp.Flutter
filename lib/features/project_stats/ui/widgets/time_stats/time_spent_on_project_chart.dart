import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/ui/widgets/base_stats_chart.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";

class TimeSpentOnProjectChart extends BaseStatsChart {
  final List<DailyProjectStats> stats;
  final int graphLength = 30;

  const TimeSpentOnProjectChart({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 4.h, right: 10.w),
        height: 200.h,
        width: double.infinity,
        child: BarChart(
          BarChartData(
            titlesData: titlesData(),
            barTouchData: barTouchData,
            barGroups: chartData,
            gridData: gridData,
            borderData: FlBorderData(show: false),
          ),
        ),
      );

  @override
  Widget getBottomTitles(double index, TitleMeta titleMeta) =>
      index.toInt() % 4 == 0 ? super.getBottomTitles(index, titleMeta) : const Text("");

  @override
  List<BaseDailyStats> get displayedStats => stats.takeLast(graphLength + 1);
}
