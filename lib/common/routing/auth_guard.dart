import 'package:auto_route/auto_route.dart';

class AuthGuard extends AutoRouteGuard {
  // ignore: non_constant_identifier_names
  void onNavigation_temp(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    // if (isAuthenticated) {
    // if user is authenticated we continue
    // resolver.next(true);
    // } else {
    // we redirect the user to our login page
    // router.push(const LoginPageRoute());
    // }
  }

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    resolver.next(true);
  }
}
