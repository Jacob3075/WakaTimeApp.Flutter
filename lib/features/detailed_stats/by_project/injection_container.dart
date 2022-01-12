import "package:get_it/get_it.dart";
import "package:waka_time_app/features/detailed_stats/by_project/ui/bloc/detailed_project_stats_bloc.dart";

void initDetailedProjectStatsServices() {
  final _getIt = GetIt.instance;

  _getIt.registerFactory(() => DetailedProjectStatsBloc());
}
