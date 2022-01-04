import "package:flutter/material.dart";
import "package:waka_time_app/common/routing/auth_guard.dart";
import "package:waka_time_app/injection_container.dart" as di;

import "common/routing/routes.gr.dart";
import "common/ui/theme/app_theme.dart";

void main() {
  di.init();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
