import "package:collection/collection.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:intl/intl.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/utils/extensions.dart";

abstract class BaseStatsChart extends StatelessWidget {
  const BaseStatsChart({Key? key}) : super(key: key);

  List<BaseDailyStats> get displayedStats;

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
                color: AppColors.accentIcons,
                toY: item.timeSpent.decimal,
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

  TextStyle get titlesStyle => TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.w300,
      );

  FlTitlesData titlesData() => FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getLeftTitles,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getBottomTitles,
          ),
        ),
      );

  Widget getBottomTitles(double index, TitleMeta titleMeta) => Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Text(
          DateFormat("E").format(displayedStats[index.toInt()].date),
          style: titlesStyle,
        ),
      );

  Widget getLeftTitles(double value, TitleMeta titleMeta) => value == titleMeta.max
      ? const SizedBox.shrink()
      : Text(
          value.isInt ? "${value.toInt()} H" : Time.fromDecimal(value).formattedPrint(),
          style: titlesStyle,
        );
}
