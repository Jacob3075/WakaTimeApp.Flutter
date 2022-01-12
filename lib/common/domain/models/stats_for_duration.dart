import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";

part "stats_for_duration.freezed.dart";
part "stats_for_duration.g.dart";

@freezed
class StatsForDuration with _$StatsForDuration {
  const StatsForDuration._();

  const factory StatsForDuration({
    required Time totalTime,
    required List<DailyStats> dailyStats,
    required StatsRange range,
  }) = _StatsForDuration;

  factory StatsForDuration.fromJson(Map<String, dynamic> json) => _$StatsForDurationFromJson(json);

  DailyStats get currentDay => dailyStats.last;
}
