import "package:get_it/get_it.dart";
import "package:waka_time_app/features/login/injection_container.dart"
    as login_di;

final getIt = GetIt.instance;

void init() {
  login_di.initLoginPageServices();
}
