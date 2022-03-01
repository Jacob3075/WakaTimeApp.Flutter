import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_systems.dart";
import "package:waka_time_app/common/domain/models/time.dart";

part "common_dtos.freezed.dart";
part "common_dtos.g.dart";

@freezed
class DataDTO with _$DataDTO {
  // TODO: FINISH MODELS
  const factory DataDTO({
    required List<CategoriesDTO> categories,
    required List<dynamic> dependencies,
    required List<EditorsDTO> editors,
    required List<LanguageDTO> languages,
    required List<MachinesDTO> machines,
    required List<ProjectDTO> projects,
    required RangeDTO range,
    @JsonKey(name: "operating_systems") required List<OperatingSystemsDTO> operatingSystems,
    @JsonKey(name: "grand_total") required GrandTotalDTO grandTotal,
  }) = _DataDTO;

  factory DataDTO.fromJson(Map<String, dynamic> json) => _$DataDTOFromJson(json);
}

@freezed
class RangeDTO with _$RangeDTO {
  const factory RangeDTO({
    required String date,
    required String end,
    required String start,
    required String text,
    required String timezone,
  }) = _RangeDTO;

  factory RangeDTO.fromJson(Map<String, dynamic> json) => _$RangeDTOFromJson(json);
}

@freezed
class GrandTotalDTO with _$GrandTotalDTO {
  const GrandTotalDTO._();

  const factory GrandTotalDTO({
    required String digital,
    required int hours,
    required int minutes,
    required String text,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _GrandTotalDTO;

  factory GrandTotalDTO.fromJson(Map<String, dynamic> json) => _$GrandTotalDTOFromJson(json);

  Time get timeSpent => Time(
        hours: hours,
        minutes: minutes,
        decimal: decimal,
      );
}

@freezed
class CumulativeTotalDTO with _$CumulativeTotalDTO {
  const CumulativeTotalDTO._();

  const factory CumulativeTotalDTO({
    required String digital,
    required double seconds,
    required String text,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
  }) = _CumulativeTotalDTO;

  factory CumulativeTotalDTO.fromJson(Map<String, dynamic> json) =>
      _$CumulativeTotalDTOFromJson(json);

  Time get totalTimeSpent => Time.fromDigital(digital, decimal);
}

@freezed
class ProjectDTO with _$ProjectDTO {
  const factory ProjectDTO({
    required String digital,
    required int hours,
    required int minutes,
    required String name,
    required double percent,
    required int seconds,
    required String text,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
  }) = _ProjectDTO;

  factory ProjectDTO.fromJson(Map<String, dynamic> json) => _$ProjectDTOFromJson(json);
}

@freezed
class LanguageDTO with _$LanguageDTO {
  const LanguageDTO._();

  const factory LanguageDTO({
    required String digital,
    required int hours,
    required int minutes,
    required String name,
    required double percent,
    required int seconds,
    required String text,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _LanguageDTO;

  factory LanguageDTO.fromJson(Map<String, dynamic> json) => _$LanguageDTOFromJson(json);

  Language convertToModel() => Language(
        name: name,
        timeSpent: Time(
          minutes: minutes,
          hours: hours,
          decimal: decimal,
        ),
        percent: percent,
      );
}

@freezed
class OperatingSystemsDTO with _$OperatingSystemsDTO {
  const OperatingSystemsDTO._();

  const factory OperatingSystemsDTO({
    required String digital,
    required int hours,
    required int minutes,
    required String name,
    required double percent,
    required int seconds,
    required String text,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _OperatingSystemsDTO;

  factory OperatingSystemsDTO.fromJson(Map<String, dynamic> json) =>
      _$OperatingSystemsDTOFromJson(json);

  OperatingSystem convertToModel() => OperatingSystem(
        name: name,
        timeSpent: Time(
          minutes: minutes,
          hours: hours,
          decimal: decimal,
        ),
        percent: percent,
      );
}

@freezed
class EditorsDTO with _$EditorsDTO {
  const EditorsDTO._();

  const factory EditorsDTO({
    required String digital,
    required int hours,
    required int minutes,
    required String name,
    required double percent,
    required int seconds,
    required String text,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _EditorsDTO;

  factory EditorsDTO.fromJson(Map<String, dynamic> json) => _$EditorsDTOFromJson(json);

  Editor convertToModel() => Editor(
        name: name,
        timeSpent: Time(
          minutes: minutes,
          hours: hours,
          decimal: decimal,
        ),
        percent: percent,
      );
}

@freezed
class CategoriesDTO with _$CategoriesDTO {
  const factory CategoriesDTO({
    required String digital,
    required int seconds,
    required String text,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
  }) = _CategoriesDTO;

  factory CategoriesDTO.fromJson(Map<String, dynamic> json) => _$CategoriesDTOFromJson(json);
}

@freezed
class MachinesDTO with _$MachinesDTO {
  const factory MachinesDTO({
    required String digital,
    required int seconds,
    required String text,
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
  }) = _MachinesDTO;

  factory MachinesDTO.fromJson(Map<String, dynamic> json) => _$MachinesDTOFromJson(json);
}

double _stringToDouble(String number) => double.parse(number);

String _doubleToString(double number) => number.toString();
