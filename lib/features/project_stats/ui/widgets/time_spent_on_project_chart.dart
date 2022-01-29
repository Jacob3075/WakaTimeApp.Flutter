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
  final List<Color> gradientColors = [
    AppGradients.primary.startColor,
    AppGradients.primary.endColor,
  ];

  TimeSpentOnProjectChart({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 32.h, right: 10.w),
        height: 180.h,
        width: double.infinity,
        child: LineChart(
          LineChartData(
            gridData: _gridData,
            titlesData: _titlesData,
            lineTouchData: _lineTouchData,
            lineBarsData: [_lineChartBarData],
            borderData: FlBorderData(show: false),
            minX: 0,
            maxX: graphLength.toDouble(),
          ),
        ),
      );

  FlGridData get _gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: const Color(0xff37434d).withAlpha(80),
          strokeWidth: 1,
        ),
      );

  LineTouchData get _lineTouchData => LineTouchData(
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: AppColors.accentIcons,
          tooltipPadding: EdgeInsets.all(6.r),
          tooltipRoundedRadius: 6.r,
          getTooltipItems: (index) => [
            LineTooltipItem(
              displayedStats[index.first.spotIndex].timeSpent.formattedPrint(),
              TextStyle(fontSize: 12.sp),
            ),
          ],
        ),
        getTouchedSpotIndicator: (barData, spotIndexes) => [
          TouchedSpotIndicatorData(
            FlLine(color: Colors.transparent, strokeWidth: 0),
            FlDotData(
              getDotPainter: (_, __, ___, ____) => FlDotCirclePainter(color: AppColors.accentIcons),
            ),
          )
        ],
      );

  LineChartBarData get _lineChartBarData => LineChartBarData(
        spots:
            displayedStats.mapIndexed((i, e) => FlSpot(i.toDouble(), e.timeSpent.decimal)).toList(),
        isCurved: true,
        colors: gradientColors,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: true,
          colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
        ),
      );

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
          getTitles: (index) => DateFormat("E").format(displayedStats[index.toInt()].date),
          getTextStyles: (_, __) => TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      );

  List<DailyProjectStats> get displayedStats => stats.takeLast(graphLength + 1);
}
