import "package:bloc/bloc.dart";
import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/features/home/domain/usecases/get_last_7_days_stats_uc.dart";

part "home_page_cubit.freezed.dart";
part "home_page_state.dart";

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  late final UserDetails userDetails;
  late final String _apiKey;
  final UserAuthCubit _userAuthCubit;
  final GetLast7DaysStatsUC _last7daysStatsUC;

  HomePageCubit({
    required UserAuthCubit userAuthCubit,
    required GetLast7DaysStatsUC last7daysStatsUC,
  })  : _userAuthCubit = userAuthCubit,
        _last7daysStatsUC = last7daysStatsUC,
        super(const HomePageState.loading()) {
    userDetails = _userAuthCubit.userDetails;
    _apiKey = _userAuthCubit.apiKey;
    _loadData();
  }

  Future<void> _loadData() async {
    emit(const HomePageState.loading());
    final Either<Errors, Summaries> result =
        await _last7daysStatsUC(GetLast7DaysStatsUCParameters(apiKey: _apiKey));
    result.fold(
      (error) => emit(HomePageState.error(error.getErrorMessage())),
      (data) => emit(HomePageState.loaded(data)),
    );
  }
}
