import "package:get_it/get_it.dart";
import "package:injectable/injectable.dart";
import "package:waka_time_app/di/injection.config.dart";

final getIt = GetIt.instance;

@InjectableInit(preferRelativeImports: false)
void configureInjection() => $initGetIt(getIt);
