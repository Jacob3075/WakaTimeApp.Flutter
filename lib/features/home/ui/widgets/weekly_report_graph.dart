import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/widgets/base_stats_chart.dart";

class WeeklyReportGraph extends BaseStatsChart {
  final Summaries summaries;

  const WeeklyReportGraph({Key? key, required this.summaries}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 4.h, right: 10.w, left: 10.w, bottom: 8.h),
        child: BarChart(
          BarChartData(
            titlesData: titlesData(),
            barTouchData: barTouchData,
            barGroups: chartData,
            gridData: gridData,
            borderData: FlBorderData(show: false),
          ),
          swapAnimationDuration: Duration.zero,
          swapAnimationCurve: Curves.easeIn,
        ),
      );

  @override
  List<BaseDailyStats> get displayedStats => summaries.dailyStats;
}
