import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/data/network/common_dtos.dart";

part "daily_stats_dto.freezed.dart";
part "daily_stats_dto.g.dart";

@freezed
class DailyStatsDTO with _$DailyStatsDTO {
  const factory DailyStatsDTO({
    @JsonKey(name: "cummulative_total") required CumulativeTotalDTO cumulativeTotal,
    required List<DataDTO> data,
    required String end,
    required String start,
  }) = _DailyStatsDTO;

  factory DailyStatsDTO.fromJson(Map<String, dynamic> json) => _$DailyStatsDTOFromJson(json);
}
