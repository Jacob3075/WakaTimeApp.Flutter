import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:intl/intl.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/models/project_details.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/usecases/get_project_details_uc.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/usecases/get_project_stats_uc.dart";

part "detailed_project_stats_bloc.freezed.dart";
part "detailed_project_stats_event.dart";
part "detailed_project_stats_state.dart";

typedef _State = DetailedProjectStatsState;
typedef _Event = DetailedProjectStatsEvent;

class DetailedProjectStatsBloc extends Bloc<_Event, _State> {
  final GetProjectStatsUC getProjectStats;
  final GetProjectDetailsUC getProjectDetailsUC;
  late final String apiKey;

  DetailedProjectStatsBloc({
    required this.getProjectStats,
    required this.getProjectDetailsUC,
    required UserAuthCubit userAuthCubit,
  }) : super(const _State.loading()) {
    apiKey = userAuthCubit.apiKey;
    on<LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadData event, Emitter emit) async {
    emit(const _State.loading());

    final projectDetailsResult = await getProjectDetailsUC(
      GetProjectDetailsUCParameters(apiKey: apiKey, project: event.projectName),
    );

    await projectDetailsResult.fold(
      (error) => _onError(error, emit),
      (data) async => await _onProjectDetailsSuccess(data, emit),
    );
  }

  Future<void> _onProjectDetailsSuccess(ProjectDetails projectDetails, Emitter emit) async {
    final formatter = DateFormat("yyyy-MM-dd");
    final projectStatsResult = await getProjectStats(
      GetProjectStatsUCParameters(
        apiKey: apiKey,
        start: formatter.format(projectDetails.createdDate),
        end: formatter.format(DateTime.now()),
        project: projectDetails.projectName,
      ),
    );
    projectStatsResult.fold(
      (error) => _onError(error, emit),
      (data) => emit(_State.dataLoaded(projectStats: data)),
    );
  }

  Future<void> _onError(Errors error, Emitter emit) async => emit(_State.error(error: error));
}
