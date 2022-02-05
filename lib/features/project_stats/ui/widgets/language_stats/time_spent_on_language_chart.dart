import "dart:math";

import "package:collection/collection.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/language.dart";

class TimeSpentOnLanguageChart extends StatelessWidget {
  final Languages languages;

  const TimeSpentOnLanguageChart({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 200.h,
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

  List<PieChartSectionData> getPieChartSections() => getReducedLanguages()
      .map((it) => PieChartSectionData(
            value: it.percent,
            radius: 70,
            title: it.name,
            showTitle: true,
            color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          ))
      .toList();

  List<Language> getReducedLanguages() {
    final sortedLangs = languages.languages.sortedBy<num>((it) => it.percent).reversed.toList();
    final top4Langs = sortedLangs.sublist(0, 4);
    final otherLangs = sortedLangs.sublist(4).fold<Language>(
          Language.none,
          (previousValue, element) => Language(
            name: "Other Langs",
            percent: previousValue.percent + element.percent,
            timeSpent: previousValue.timeSpent + element.timeSpent,
          ),
        );
    return top4Langs + [otherLangs];
  }
}
