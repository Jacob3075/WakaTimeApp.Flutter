import "package:freezed_annotation/freezed_annotation.dart";

part "daily_stats_dto.freezed.dart";
part "daily_stats_dto.g.dart";

@freezed
class DailyStatsDTO with _$DailyStatsDTO {
  const factory DailyStatsDTO({
    @JsonKey(name: "cummulative_total") required CumulativeTotal cumulativeTotal,
    required List<Data> data,
    required String end,
    required String start,
  }) = _DailyStatsDTO;

  factory DailyStatsDTO.fromJson(Map<String, dynamic> json) => _$DailyStatsDTOFromJson(json);
}

@freezed
class Data with _$Data {
  // TODO: FINISH MODELS
  const factory Data({
    required List<dynamic> categories,
    required List<dynamic> dependencies,
    required List<EditorsDTO> editors,
    @JsonKey(name: "grand_total") required GrandTotal grandTotal,
    required List<LanguageDTO> languages,
    required List<dynamic> machines,
    @JsonKey(name: "operating_systems") required List<OperatingSystemsDTO> operatingSystems,
    required List<ProjectDTO> projects,
    required Range range,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Range with _$Range {
  const factory Range({
    required String date,
    required String end,
    required String start,
    required String text,
    required String timezone,
  }) = _Range;

  factory Range.fromJson(Map<String, dynamic> json) => _$RangeFromJson(json);
}

@freezed
class GrandTotal with _$GrandTotal {
  const factory GrandTotal({
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    required String digital,
    required int hours,
    required int minutes,
    required String text,
    @JsonKey(name: "total_seconds") required double totalSeconds,
  }) = _GrandTotal;

  factory GrandTotal.fromJson(Map<String, dynamic> json) => _$GrandTotalFromJson(json);
}

@freezed
class CumulativeTotal with _$CumulativeTotal {
  const factory CumulativeTotal({
    @JsonKey(fromJson: _stringToDouble, toJson: _doubleToString) required double decimal,
    required String digital,
    required double seconds,
    required String text,
  }) = _CumulativeTotal;

  factory CumulativeTotal.fromJson(Map<String, dynamic> json) => _$CumulativeTotalFromJson(json);
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
