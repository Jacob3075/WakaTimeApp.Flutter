import "package:auto_route/annotations.dart";
import "package:waka_time_app/common/routing/auth_guard.dart";
import "package:waka_time_app/features/home/ui/home_page.dart";
import "package:waka_time_app/features/login/ui/login_page.dart";

@MaterialAutoRouter(routes: <AutoRoute>[
  AutoRoute(page: LoginPage),
  AutoRoute(page: HomePage, initial: true, guards: [AuthGuard])
])
class $AppRouter {}
