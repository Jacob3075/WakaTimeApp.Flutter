import "package:get_it/get_it.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";

void homePageInjectionContainer() {
  final _getIt = GetIt.instance;

  _getIt.registerFactory(() => HomePageCubit());
}
