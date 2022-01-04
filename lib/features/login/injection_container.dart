import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get_it/get_it.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/user_details_store.dart";
import "package:waka_time_app/features/login/data/login_api.dart";
import "package:waka_time_app/features/login/ui/bloc/login_page_cubit.dart";

final getIt = GetIt.instance;

void initLoginPageServices() {
  getIt.registerSingleton(const FlutterSecureStorage());
  getIt.registerSingleton(http.Client());

  getIt.registerSingleton(LoginApi(client: getIt()));
  getIt.registerSingleton(UserDetailsStore(storage: getIt()));

  getIt.registerFactory(() => LoginPageCubit(
        loginApi: getIt(),
        store: getIt(),
      ));
}
