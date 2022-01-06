import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:get_it/get_it.dart";
import "package:waka_time_app/common/data/local/user_details_store.dart";
import "package:waka_time_app/features/login/domain/check_login_status_uc.dart";
import "package:waka_time_app/features/login/domain/get_user_details_uc.dart";
import "package:waka_time_app/features/login/ui/bloc/login_page_cubit.dart";

void initLoginPageServices() {
  final _getIt = GetIt.instance;
  _getIt.registerSingleton(const FlutterSecureStorage());

  _getIt.registerSingleton(UserDetailsStore(storage: _getIt()));
  _getIt.registerSingleton(GetUserDetailsUC(client: _getIt()));
  _getIt.registerSingleton(CheckAuthStatusUC(store: _getIt()));

  _getIt.registerFactory(() => LoginPageCubit(
        loginApi: _getIt(),
        store: _getIt(),
      ));
}
