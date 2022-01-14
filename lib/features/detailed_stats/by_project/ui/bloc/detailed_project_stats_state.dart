part of "detailed_project_stats_bloc.dart";

@freezed
class DetailedProjectStatsState with _$DetailedProjectStatsState {
  const factory DetailedProjectStatsState.loading() = Loading;

  const factory DetailedProjectStatsState.dataLoaded({required Summaries projectStats}) =
      DataLoaded;

  const factory DetailedProjectStatsState.error({required Errors errorMessage}) = Error;
}
