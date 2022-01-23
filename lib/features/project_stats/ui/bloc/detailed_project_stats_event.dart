part of "detailed_project_stats_bloc.dart";

@freezed
class DetailedProjectStatsEvent with _$DetailedProjectStatsEvent {
  const factory DetailedProjectStatsEvent.loadData({required String projectName}) = LoadData;
}
