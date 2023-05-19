import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/data/network/dtos/common_dtos.dart";

part "project_summaries_dto.freezed.dart";
part "project_summaries_dto.g.dart";

@freezed
class ProjectSummariesDTO with _$ProjectSummariesDTO {
  const factory ProjectSummariesDTO({
    @JsonKey(name: "cumulative_total")
        required CumulativeTotalDTO cumulativeTotal,
    @JsonKey(name: "available_branches")
        required List<String> availableBranches,
    required List<ProjectDataDTO> data,
    required String end,
    required String start,
  }) = Project_SummariesDTO;

  factory ProjectSummariesDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectSummariesDTOFromJson(json);
}

@freezed
class ProjectDataDTO with _$ProjectDataDTO {
  const factory ProjectDataDTO({
    required List<CategoriesDTO> categories,
    required List<dynamic> dependencies,
    required List<EditorsDTO> editors,
    required List<LanguageDTO> languages,
    required List<MachinesDTO> machines,
    required RangeDTO range,
    @JsonKey(name: "operating_systems")
        required List<OperatingSystemsDTO> operatingSystems,
    @JsonKey(name: "grand_total") required GrandTotalDTO grandTotal,
  }) = Project_DataDTO;

  factory ProjectDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectDataDTOFromJson(json);
}
