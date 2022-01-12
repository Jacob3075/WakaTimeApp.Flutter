import "package:bloc/bloc.dart";
import "package:freezed_annotation/freezed_annotation.dart";

part "detailed_project_stats_bloc.freezed.dart";
part "detailed_project_stats_event.dart";
part "detailed_project_stats_state.dart";

typedef _State = DetailedProjectStatsState;
typedef _Event = DetailedProjectStatsEvent;

class DetailedProjectStatsBloc extends Bloc<_Event, _State> {
  DetailedProjectStatsBloc() : super(const _State.dataLoaded()) {
    on<LoadData>(_onLoadData);
    on<LoadedData>(_onLoadedData);
  }

  void _onLoadData(LoadData event, Emitter emitter) {}

  void _onLoadedData(LoadedData event, Emitter emitter) {}
}
