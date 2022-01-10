import "package:bloc/bloc.dart";
import "package:dartz/dartz.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:waka_time_app/common/data/network/errors.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/home/domain/get_daily_stats_uc.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";

part "home_page_cubit.freezed.dart";
part "home_page_state.dart";

class HomePageCubit extends Cubit<HomePageState> {
  late final UserDetails userDetails;
  late final String _apiKey;
  final UserAuthCubit _userAuthCubit;
  final GetDailyStatsUC _dailyStatsUC;

  HomePageCubit({
    required UserAuthCubit userAuthCubit,
    required GetDailyStatsUC dailyStatsUC,
  })  : _userAuthCubit = userAuthCubit,
        _dailyStatsUC = dailyStatsUC,
        super(const HomePageState.loading()) {
    userDetails = _userAuthCubit.userDetails;
    _apiKey = _userAuthCubit.apiKey;
    _loadData();
  }

  Future<void> _loadData() async {
    emit(const HomePageState.loading());
    final Either<Errors, DailyStats> result =
        await _dailyStatsUC(GetDailyStatsUCParameters(apiKey: _apiKey));
    result.fold(
      (error) => emit(HomePageState.error(error.getErrorMessage())),
      (data) => emit(HomePageState.loaded(data)),
    );
  }
}
