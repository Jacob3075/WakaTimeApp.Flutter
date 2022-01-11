import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/data/network/common_dtos.dart";

part "last_7_days_stats_dto.freezed.dart";
part "last_7_days_stats_dto.g.dart";

@freezed
class Last7DaysStatsDTO with _$Last7DaysStatsDTO {
  const factory Last7DaysStatsDTO({
    @JsonKey(name: "cummulative_total") required CumulativeTotalDTO cumulativeTotal,
    required List<DataDTO> data,
    required String end,
    required String start,
  }) = _Last7DaysStatsDTO;

  factory Last7DaysStatsDTO.fromJson(Map<String, dynamic> json) =>
      _$Last7DaysStatsDTOFromJson(json);
}
