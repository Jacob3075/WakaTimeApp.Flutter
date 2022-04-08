import "dart:async";

import "package:bloc/bloc.dart";
import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/features/search_projects/domain/usecases/get_all_projects_uc.dart";

part "search_projects_bloc.freezed.dart";

part "search_projects_event.dart";

part "search_projects_state.dart";

typedef _S = SearchProjectsState;
typedef _E = SearchProjectsEvent;

@injectable
class SearchProjectsBloc extends Bloc<_E, _S> {
  late final String apiKey;

  final GetAllProjectsUC getAllProjectsUC;

  SearchProjectsBloc({
    required this.getAllProjectsUC,
    required UserAuthCubit userAuthCubit,
  }) : super(const _S.loading()) {
    apiKey = userAuthCubit.apiKey;
    on<LoadData>(_onLoadData);
  }

  Future<void> _onLoadData(LoadData event, Emitter emit) async {
    emit(const _S.loading());

    final Either<Errors, List<ProjectDetails>> eitherProjectDetails =
        await getAllProjectsUC(GetAllProjectsUCParameters(apiKey: apiKey));

    eitherProjectDetails.fold(
      (error) => _onError(error, emit),
      (data) => emit(_S.dataLoaded(projectDetails: data)),
    );
  }

  Future<void> _onError(Errors error, Emitter emit) async => emit(_S.error(error: error));
}
