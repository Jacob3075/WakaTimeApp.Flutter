import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:splashscreen/splashscreen.dart";
import "package:waka_time_app/common/routing/routes.gr.dart";
import "package:waka_time_app/common/ui/theme/colors.dart";
import "package:waka_time_app/features/login/domain/check_login_status_uc.dart";
import "package:waka_time_app/features/login/domain/get_user_details_uc.dart";
import "package:waka_time_app/injection_container.dart";

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({Key? key}) : super(key: key);

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 14,
      navigateAfterFuture: _navigateOrLoadData(context),
      title: const Text(
        "Welcome In SplashScreen",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      image: Image.asset("assets/ic_launcher.png"),
      backgroundColor: AppColors.appBG,
      styleTextUnderTheLoader: const TextStyle(),
      photoSize: 100.0,
      loaderColor: AppColors.accentIcons,
      loadingText: const Text(""),
      useLoader: false,
      loadingTextPadding: const EdgeInsets.all(0),
    );
  }

  Future<Widget> _navigateOrLoadData(BuildContext context) async {
    final CheckAuthStatusUC checkAuthStatus = getIt();
    final maybeKey = await checkAuthStatus();
    if (maybeKey == null) {
      AutoRouter.of(context).replace(const LoginPageRoute());
    } else {
      final GetUserDetailsUC getUserDetailsUC = getIt();
      final result =
          await getUserDetailsUC(GetUserDetailsUCParameters(apiKey: maybeKey));
      result.fold(
        (error) => AutoRouter.of(context).replace(const LoginPageRoute()),
        (data) => AutoRouter.of(context).replace(const HomePageRoute()),
      );
    }
    return const SizedBox.shrink();
  }
}
