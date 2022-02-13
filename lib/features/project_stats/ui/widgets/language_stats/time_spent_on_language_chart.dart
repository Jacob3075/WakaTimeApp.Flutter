import "dart:math";

import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class TimeSpentOnLanguageChart extends StatelessWidget {
  final Languages languages;

  const TimeSpentOnLanguageChart({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 200.h,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: const BoxDecoration(
          boxShadow: [AppShadows.chartShadow],
          shape: BoxShape.circle,
        ),
        child: PieChart(
          PieChartData(
            sections: getPieChartSections(),
            centerSpaceRadius: 30.r,
            pieTouchData: PieTouchData(),
            borderData: FlBorderData(
              show: true,
              border: const Border(),
            ),
          ),
        ),
      );

  List<PieChartSectionData> getPieChartSections() => languages
      .topNAndCombineOthers(3)
      .values
      .map((it) => PieChartSectionData(
            value: it.percent,
            radius: 80,
            title: it.name,
            showTitle: true,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ))
      .toList();
}
