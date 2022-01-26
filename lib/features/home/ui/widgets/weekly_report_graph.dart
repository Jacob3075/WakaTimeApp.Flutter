import "package:collection/collection.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:intl/intl.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class WeeklyReportGraph extends StatelessWidget {
  final Summaries summaries;

  const WeeklyReportGraph({Key? key, required this.summaries}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(top: 18.h, left: 12.w, right: 12.w, bottom: 8.h),
        child: BarChart(
          BarChartData(
            axisTitleData: FlAxisTitleData(
              show: true,
              rightTitle: AxisTitle(showTitle: false),
            ),
            titlesData: _titlesData,
            barTouchData: _barTouchData,
            barGroups: _chartData,
            gridData: FlGridData(
              drawHorizontalLine: true,
              drawVerticalLine: false,
            ),
            borderData: FlBorderData(show: false),
          ),
          swapAnimationDuration: Duration.zero,
          swapAnimationCurve: Curves.easeIn,
        ),
      );

  List<BarChartGroupData> get _chartData => summaries.dailyStats
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

  BarTouchData get _barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: EdgeInsets.all(6.r),
          tooltipRoundedRadius: 6.r,
          getTooltipItem: (groupData, groupIndex, rodData, rodIndex) => BarTooltipItem(
            summaries.dailyStats[groupIndex].timeSpent.formattedPrint(),
            const TextStyle(),
          ),
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
          getTitles: (index) => DateFormat("E").format(summaries.dailyStats[index.toInt()].date),
          getTextStyles: (_, __) => TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      );
}
