import "package:auto_route/auto_route.dart";
import "package:waka_time_app/common/ui/routing/auth_guard.dart";
import "package:waka_time_app/features/home/ui/home_page.dart";
import "package:waka_time_app/features/login/ui/login_page.dart";
import "package:waka_time_app/features/login/ui/splash_screen.dart";
import "package:waka_time_app/features/project_stats/ui/detailed_project_stats.dart";
import "package:waka_time_app/features/search_projects/ui/search_projects.dart";

// TODO: ADD TRANSITION ANIMATION
@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: AppSplashScreen, initial: true),
    AutoRoute(page: LoginPage),
    AutoRoute(page: HomePage, guards: [AuthGuard]),
    AutoRoute(page: DetailedProjectStats, guards: [AuthGuard]),
    AutoRoute(page: SearchProjects, guards: [AuthGuard]),
  ],
  preferRelativeImports: false,
)
class $AppRouter {}
