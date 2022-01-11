import "package:get_it/get_it.dart";
import "package:waka_time_app/features/home/domain/get_last_7_days_stats_uc.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";

void initHomePageServices() {
  final _getIt = GetIt.instance;

  _getIt.registerSingleton(GetLast7DaysStatsUC(client: _getIt()));
  _getIt.registerFactory(() => HomePageCubit(userAuthCubit: _getIt(), last7daysStatsUC: _getIt()));
}
