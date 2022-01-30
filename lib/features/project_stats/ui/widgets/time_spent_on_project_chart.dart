import "package:collection/collection.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:intl/intl.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";

class TimeSpentOnProjectChart extends StatelessWidget {
  final List<DailyProjectStats> stats;
  final int graphLength = 30;

  const TimeSpentOnProjectChart({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 32.h, right: 10.w),
        height: 180.h,
        width: double.infinity,
        child: BarChart(
          BarChartData(
            titlesData: _titlesData,
            barTouchData: _barTouchData,
            barGroups: _chartData,
            // lineBarsData: [_lineChartBarData],
            gridData: _gridData,
            borderData: FlBorderData(show: false),
          ),
        ),
      );

  FlGridData get _gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        ),
      );

  BarTouchData get _barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: EdgeInsets.all(6.r),
          tooltipRoundedRadius: 6.r,
          getTooltipItem: (groupData, groupIndex, rodData, rodIndex) => BarTooltipItem(
            displayedStats[groupIndex].timeSpent.formattedPrint(),
            const TextStyle(),
          ),
        ),
      );

  List<BarChartGroupData> get _chartData => displayedStats
      .mapIndexed((index, item) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                colors: [AppColors.accentIcons],
                y: item.timeSpent.decimal,
                width: 10,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(6.r),
                  topRight: Radius.circular(6.r),
                ),
              )
            ],
          ))
      .toList();

  FlTitlesData get _titlesData => FlTitlesData(
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(
          showTitles: true,
          margin: 4,
          getTextStyles: (_, __) => TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
          getTitles: (value) => "${value.toInt()} H",
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: (index) => index.toInt() % 4 == 0
              ? DateFormat("E").format(displayedStats[index.toInt()].date)
              : "",
          getTextStyles: (_, __) => TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      );

  List<DailyProjectStats> get displayedStats => stats.takeLast(graphLength + 1);
}
