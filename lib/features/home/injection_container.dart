import "package:get_it/get_it.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";

void initHomePageServices() {
  final _getIt = GetIt.instance;

  _getIt.registerFactoryParam(
    (UserDetails userDetails, String apiKey) => HomePageCubit(userAuthCubit: _getIt()),
  );
}
