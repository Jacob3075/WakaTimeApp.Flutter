import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:intl/intl.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/utils/extensions.dart";

abstract class BaseStatsChart extends StatelessWidget {
  const BaseStatsChart({Key? key}) : super(key: key);

  List<BaseDailyStats> get displayedStats;

  String getBottomTitles(double index) =>
      DateFormat("E").format(displayedStats[index.toInt()].date);

  String getLeftTitles(double value) =>
      value.isInt ? "${value.toInt()} H" : Time.fromDecimal(value).formattedPrint();

  FlGridData get gridData => FlGridData(
        show: true,
        drawHorizontalLine: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) => FlLine(
          color: const Color(0xff37434d),
          strokeWidth: 1,
        ),
      );

  List<BarChartGroupData> get chartData => displayedStats
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

  BarTouchData get barTouchData => BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          tooltipPadding: EdgeInsets.all(6.r),
          tooltipRoundedRadius: 6.r,
          getTooltipItem: (groupData, groupIndex, rodData, rodIndex) => BarTooltipItem(
            displayedStats[groupIndex].timeSpent.formattedPrint(),
            const TextStyle(),
          ),
          fitInsideHorizontally: true,
          fitInsideVertically: true,
        ),
      );

  FlTitlesData titlesData({double margin = 4}) => FlTitlesData(
        topTitles: SideTitles(showTitles: false),
        rightTitles: SideTitles(showTitles: false),
        leftTitles: SideTitles(
          showTitles: true,
          margin: margin,
          getTextStyles: (_, __) => TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
          getTitles: getLeftTitles,
          checkToShowTitle: (min, max, side, interval, value) => value == max ? false : true,
        ),
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: getBottomTitles,
          getTextStyles: (_, __) => TextStyle(
            fontSize: 10.sp,
            fontWeight: FontWeight.w300,
          ),
        ),
      );

  bool valueDivisibleByInterval(double value, double interval) => value % interval == 0;
}
