import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";

class TimeSpentOnLanguageChart extends StatelessWidget {
  final List<Language> languages;

  const TimeSpentOnLanguageChart({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200.h,
        child: PieChart(
          PieChartData(
            sections: getPieChartSections(),
            centerSpaceRadius: 0.r,
            pieTouchData: PieTouchData(),
            borderData: FlBorderData(
              show: true,
              border: const Border(),
            ),
          ),
        ),
      );

  List<PieChartSectionData> getPieChartSections() => languages
      .map(
        (it) => PieChartSectionData(
          value: it.percent,
          radius: 80,
          title: it.name,
          showTitle: true,
        ),
      )
      .toList();
}
