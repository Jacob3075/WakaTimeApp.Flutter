import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";

part "last_7_days_stats.freezed.dart";
part "last_7_days_stats.g.dart";

@freezed
class Last7DaysStats with _$Last7DaysStats {
  const factory Last7DaysStats({
    required Time totalTime,
    required List<DailyStats> dailyStats,
    required StatsRange range,
  }) = _Last7DaysStats;

  factory Last7DaysStats.fromJson(Map<String, dynamic> json) => _$Last7DaysStatsFromJson(json);
}
