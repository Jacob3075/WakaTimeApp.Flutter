part of "search_projects_bloc.dart";

@freezed
class SearchProjectsState with _$SearchProjectsState {
  const factory SearchProjectsState.loading() = Loading;

  const factory SearchProjectsState.dataLoaded({required List<ProjectDetails> projectDetails}) =
      DataLoaded;

  const factory SearchProjectsState.error({required Errors error}) = Error;
}
