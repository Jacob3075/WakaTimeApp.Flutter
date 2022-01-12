import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "detailed_project_stats_bloc.freezed.dart";
part "detailed_project_stats_event.dart";
part "detailed_project_stats_state.dart";

typedef _State = DetailedProjectStatsState;
typedef _Event = DetailedProjectStatsEvent;

class DetailedProjectStatsBloc extends Bloc<_Event, _State> {
  DetailedProjectStatsBloc() : super(const _State.initialState()) {
    on<_Event>(
      (event, emit) => event.when(
        loadData: _onLoadData,
      ),
    );
  }

  void _onLoadData() {}
}
