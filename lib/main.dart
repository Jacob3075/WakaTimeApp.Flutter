import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/common/ui/routing/auth_guard.dart";
import "package:waka_time_app/common/ui/routing/routes.gr.dart";
import "package:waka_time_app/common/ui/theme/app_theme.dart";
import "package:waka_time_app/di/injection.dart" as di;

void main() {
  di.configureInjection();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final AppRouter _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
        designSize: const Size(411, 750),
        minTextAdapt: true,
        builder: (context, _) => BlocProvider(
          create: (_) => di.getIt<UserAuthCubit>(),
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routeInformationParser: _appRouter.defaultRouteParser(),
            routerDelegate: _appRouter.delegate(),
            theme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
          ),
        ),
      );
}
