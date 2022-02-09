import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/time.dart";

class Summaries {
  final Time totalTime;
  final List<DailyStats> dailyStats;
  final StatsRange range;

  const Summaries({
    required this.totalTime,
    required this.dailyStats,
    required this.range,
  });

  DailyStats get currentDay => dailyStats.last;
}
