import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/usecases/get_project_details_uc.dart";
import "package:waka_time_app/features/project_stats/domain/usecases/get_project_stats_uc.dart";

part "detailed_project_stats_bloc.freezed.dart";
part "detailed_project_stats_event.dart";
part "detailed_project_stats_state.dart";

typedef _S = DetailedProjectStatsState;
typedef _E = DetailedProjectStatsEvent;

@injectable
class DetailedProjectStatsBloc extends Bloc<_E, _S> {
  final GetProjectStatsUC getProjectStats;
  final GetProjectDetailsUC getProjectDetailsUC;
  late final String apiKey;

  DetailedProjectStatsBloc({
    required this.getProjectStats,
    required this.getProjectDetailsUC,
    required UserAuthCubit userAuthCubit,
  }) : super(const _S.loading()) {
    apiKey = userAuthCubit.apiKey;
    on<LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadData event, Emitter emit) async {
    emit(const _S.loading());

    final projectDetailsResult = await getProjectDetailsUC(
      GetProjectDetailsUCParameters(apiKey: apiKey, project: event.projectName),
    );

    await projectDetailsResult.fold(
      (error) => _onError(error, emit),
      (data) async => await _onProjectDetailsSuccess(data, emit),
    );
  }

  Future<void> _onProjectDetailsSuccess(ProjectDetails projectDetails, Emitter emit) async {
    final end = DateTime.now();
    final start = end.subtract(const Duration(days: 14));
    final projectStatsResult = await getProjectStats(
      GetProjectStatsUCParameters(
        apiKey: apiKey,
        start: start,
        end: end,
        project: projectDetails.projectName,
      ),
    );
    projectStatsResult.fold(
      (error) => _onError(error, emit),
      (data) => emit(_S.dataLoaded(projectSummaries: data)),
    );
  }

  Future<void> _onError(Errors error, Emitter emit) async => emit(_S.error(error: error));
}
