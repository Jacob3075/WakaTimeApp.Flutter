import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/data/network/dtos/common_dtos.dart";

part "summaries_dto.freezed.dart";
part "summaries_dto.g.dart";

@freezed
class SummariesDTO with _$SummariesDTO {
  const factory SummariesDTO({
    @JsonKey(name: "cummulative_total") required CumulativeTotalDTO cumulativeTotal,
    required List<DataDTO> data,
    required String end,
    required String start,
  }) = _SummariesDTO;

  factory SummariesDTO.fromJson(Map<String, dynamic> json) => _$SummariesDTOFromJson(json);
}
