import "package:freezed_annotation/freezed_annotation.dart";

part "common_dtos.freezed.dart";
part "common_dtos.g.dart";


@freezed
class DataDTO with _$DataDTO {
  // TODO: FINISH MODELS
  const factory DataDTO({
    required List<dynamic> categories,
    required List<dynamic> dependencies,
    required List<EditorsDTO> editors,
    @JsonKey(name: "grand_total") required GrandTotalDTO grandTotal,
    required List<LanguageDTO> languages,
    required List<dynamic> machines,
    @JsonKey(name: "operating_systems") required List<OperatingSystemsDTO> operatingSystems,
    required List<ProjectDTO> projects,
    required RangeDTO range,
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
  const factory GrandTotalDTO({
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    required String digital,
    required int hours,
    required int minutes,
    required String text,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _GrandTotalDTO;

  factory GrandTotalDTO.fromJson(Map<String, dynamic> json) => _$GrandTotalDTOFromJson(json);
}

@freezed
class CumulativeTotalDTO with _$CumulativeTotalDTO {
  const factory CumulativeTotalDTO({
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    required String digital,
    required double seconds,
    required String text,
  }) = _CumulativeTotalDTO;

  factory CumulativeTotalDTO.fromJson(Map<String, dynamic> json) => _$CumulativeTotalDTOFromJson(json);
}

@freezed
class ProjectDTO with _$ProjectDTO {
  const factory ProjectDTO({
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    required String digital,
    required int hours,
    required int minutes,
    required String name,
    required double percent,
    required int seconds,
    required String text,
  }) = _ProjectDTO;

  factory ProjectDTO.fromJson(Map<String, dynamic> json) => _$ProjectDTOFromJson(json);
}

@freezed
class LanguageDTO with _$LanguageDTO {
  const factory LanguageDTO({
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    required String digital,
    required int hours,
    required int minutes,
    required String name,
    required double percent,
    required int seconds,
    required String text,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _LanguageDTO;

  factory LanguageDTO.fromJson(Map<String, dynamic> json) => _$LanguageDTOFromJson(json);
}

@freezed
class OperatingSystemsDTO with _$OperatingSystemsDTO {
  const factory OperatingSystemsDTO({
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    required String digital,
    required int hours,
    required int minutes,
    required String name,
    required double percent,
    required int seconds,
    required String text,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _OperatingSystemsDTO;

  factory OperatingSystemsDTO.fromJson(Map<String, dynamic> json) =>
      _$OperatingSystemsDTOFromJson(json);
}

@freezed
class EditorsDTO with _$EditorsDTO {
  const factory EditorsDTO({
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    required String digital,
    required int hours,
    required int minutes,
    required String name,
    required double percent,
    required int seconds,
    required String text,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _EditorsDTO;

  factory EditorsDTO.fromJson(Map<String, dynamic> json) => _$EditorsDTOFromJson(json);
}

double _stringToDouble(String number) => double.parse(number);

String _doubleToString(double number) => number.toString();
