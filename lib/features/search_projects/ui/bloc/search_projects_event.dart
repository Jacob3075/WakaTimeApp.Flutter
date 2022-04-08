part of "search_projects_bloc.dart";

@freezed
class SearchProjectsEvent with _$SearchProjectsEvent {
  const factory SearchProjectsEvent.loadData() = LoadData;
}
