import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/time.dart";

part "summaries.freezed.dart";

@freezed
class Summaries with _$Summaries {
  const Summaries._();

  const factory Summaries({
    required Time totalTime,
    required List<DailyStats> dailyStats,
    required StatsRange range,
  }) = _Summaries;

  DailyStats get currentDay => dailyStats.last;
}
