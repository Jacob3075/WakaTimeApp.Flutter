import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:splashscreen/splashscreen.dart";
import "package:waka_time_app/common/routing/routes.gr.dart";
import "package:waka_time_app/common/ui/bloc/user_auth_cubit.dart";
import "package:waka_time_app/common/ui/theme/colors.dart";

// TODO: STYLE SPLASH SCREEN TEXT
class AppSplashScreen extends StatelessWidget {
  const AppSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<UserAuthCubit, UserAuthState>(
        listener: (context, state) => state.when(
          loading: () => null,
          loggedOut: () => context.router.replace(const LoginPageRoute()),
          loggedIn: () => context.router.replace(const HomePageRoute()),
        ),
        builder: (context, _) => SplashScreen(
          // seconds: 10,
          // navigateAfterSeconds: null,
          navigateAfterFuture: context.read<UserAuthCubit>().updateLoginStateAndDetails(),
          title: const Text(
            "Wakatime Client",
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
        ),
      );
}
