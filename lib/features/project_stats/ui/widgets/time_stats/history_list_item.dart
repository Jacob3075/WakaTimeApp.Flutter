import "package:flutter/material.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";

class HistoryListItem extends StatelessWidget {
  final DailyProjectStats dailyProjectStat;

  const HistoryListItem({Key? key, required this.dailyProjectStat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(dailyProjectStat.timeSpent.formattedPrint());
  }
}
