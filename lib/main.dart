import "package:flutter/material.dart";

import "common/routing/routes.gr.dart";
import "common/ui/theme/app_theme.dart";

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);
  final _appRouter = AppRouter();

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
