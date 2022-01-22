import "package:get_it/get_it.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/usecases/get_project_details_uc.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/usecases/get_project_stats_uc.dart";
import "package:waka_time_app/features/detailed_stats/by_project/ui/bloc/detailed_project_stats_bloc.dart";

void initDetailedProjectStatsServices() {
  final _getIt = GetIt.instance;

  _getIt.registerSingleton(GetProjectStatsUC(client: _getIt()));
  _getIt.registerSingleton(GetProjectDetailsUC(client: _getIt()));

  _getIt.registerFactory(
    () => DetailedProjectStatsBloc(
      getProjectStats: _getIt(),
      userAuthCubit: _getIt(),
      getProjectDetailsUC: _getIt(),
    ),
  );
}
