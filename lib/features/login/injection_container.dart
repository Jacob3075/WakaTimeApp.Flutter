import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get_it/get_it.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/user_details_store.dart";
import "package:waka_time_app/features/login/data/login_api.dart";
import "package:waka_time_app/features/login/ui/bloc/login_page_cubit.dart";

void initLoginPageServices() {
  final _getIt = GetIt.instance;
  _getIt.registerSingleton(const FlutterSecureStorage());
  _getIt.registerSingleton(http.Client());

  _getIt.registerSingleton(LoginApi(client: _getIt()));
  _getIt.registerSingleton(UserDetailsStore(storage: _getIt()));

  _getIt.registerFactory(() => LoginPageCubit(
        loginApi: _getIt(),
        store: _getIt(),
      ));
}
