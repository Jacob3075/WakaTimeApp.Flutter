import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get_it/get_it.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/api_key_store.dart";
import "package:waka_time_app/features/login/data/login_api.dart";
import "package:waka_time_app/features/login/ui/bloc/login_page_cubit.dart";

final getIt = GetIt.instance;

void initLoginPageServices() {
  getIt.registerSingleton(const FlutterSecureStorage());
  getIt.registerSingleton(http.Client());

  getIt.registerSingletonWithDependencies(
    () => LoginApi(client: getIt()),
    dependsOn: [http.Client],
  );
  getIt.registerSingletonWithDependencies(
    () => ApiKeyStore(storage: getIt()),
    dependsOn: [FlutterSecureStorage],
  );

  getIt.registerFactory(() => LoginPageCubit(
        loginApi: getIt(),
        store: getIt(),
      ));
}
