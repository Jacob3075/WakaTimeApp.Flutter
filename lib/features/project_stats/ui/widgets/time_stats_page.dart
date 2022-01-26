import "package:flutter/material.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_spent_on_project_chart.dart";

class TimeStatsPage extends StatelessWidget {
  final Summaries projectStats;

  const TimeStatsPage({Key? key, required this.projectStats}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TimeSpentOnProjectChart(
            stats: projectStats.dailyStats,
          ),
        ],
      );
}
