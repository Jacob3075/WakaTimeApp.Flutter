import "package:get_it/get_it.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/features/home/injection_container.dart"
    as home_page_di;
import "package:waka_time_app/features/login/injection_container.dart"
    as login_di;

final getIt = GetIt.instance;

void init() {
  getIt.registerSingleton(http.Client());

  login_di.initLoginPageServices();
  home_page_di.homePageInjectionContainer();
}
