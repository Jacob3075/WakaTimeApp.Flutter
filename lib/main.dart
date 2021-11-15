import 'package:flutter/material.dart';
import 'package:waka_time_app/common/routing/auth_guard.dart';

import 'common/routing/routes.gr.dart';

void main() {
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
    );
  }
}
