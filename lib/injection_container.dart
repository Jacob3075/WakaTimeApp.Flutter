import "package:get_it/get_it.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/features/detailed_stats/by_project/injection_container.dart"
    as project_stats_di;
import "package:waka_time_app/features/home/injection_container.dart" as home_page_di;
import "package:waka_time_app/features/login/injection_container.dart" as login_di;

final getIt = GetIt.instance;

void init() {
  getIt.registerSingleton(http.Client());
  getIt.registerLazySingleton(
    () => UserAuthCubit(getUserDetailsUC: getIt(), checkAuthStatus: getIt()),
  );

  login_di.initLoginPageServices();
  home_page_di.initHomePageServices();
  project_stats_di.initDetailedProjectStatsServices();
}
