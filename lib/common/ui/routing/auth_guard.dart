import "package:auto_route/auto_route.dart";
import "package:waka_time_app/common/data/local/user_details_store.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/ui/routing/routes.gr.dart";
import "package:waka_time_app/di/injection.dart";

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final userDetailsStore = getIt<UserDetailsStore>();
    final String? apiKey = await userDetailsStore.getApiKey();
    final UserDetails? userDetails = await userDetailsStore.getUserDetails();

    if (apiKey == null || userDetails == null) {
      router.popAndPush(const LoginPageRoute());
    } else {
      resolver.next(true);
    }
  }
}
