import "package:auto_route/auto_route.dart";
import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:url_launcher/url_launcher.dart";
import "package:waka_time_app/common/routing/routes.gr.dart";
import "package:waka_time_app/common/ui/gradient_button.dart";
import "package:waka_time_app/common/ui/theme/colors.dart";
import "package:waka_time_app/common/utils/constants.dart";
import "package:waka_time_app/features/login/ui/bloc/login_page_cubit.dart";
import "package:waka_time_app/injection_container.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final apiKeyTextController = TextEditingController();

  @override
  void dispose() {
    apiKeyTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (context) => getIt<LoginPageCubit>(),
            child: BlocConsumer<LoginPageCubit, LoginPageState>(
              listener: (context, state) {
                if (state is Error) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text(state.errorMessage)));
                } else if (state is Loading) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) =>
                        const Center(child: CircularProgressIndicator()),
                  );
                } else if (state is Success) {
                  AutoRouter.of(context).replace(const HomePageRoute());
                }
              },
              builder: (context, _) => _buildDefaultStatePage(context),
            ),
          ),
        ),
      );

  Widget _buildDefaultStatePage(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _appTitle(),
          _apiKeyInputSection(),
          _loginButton(context),
        ],
      );

  Widget _appTitle() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "Wakatime Client",
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Widget _apiKeyInputSection() {
    const borderRadiusValue = 20.0;
    const borderRadius = BorderRadius.all(Radius.circular(borderRadiusValue));

    final apiKeyInput = Container(
      decoration: _createShadowDecoration(borderRadiusValue),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: apiKeyTextController,
        decoration: const InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.accentIcons),
            borderRadius: borderRadius,
          ),
          border: OutlineInputBorder(
            borderRadius: borderRadius,
          ),
          labelText: "Enter API Key",
          labelStyle: TextStyle(color: Colors.white38),
        ),
        onSubmitted: (newString) {},
      ),
    );

    final apiKeyLink = RichText(
      text: TextSpan(
        text: "Get API key from ",
        children: [
          TextSpan(
            text: "here.",
            style: const TextStyle(color: AppColors.accentText),
            recognizer: TapGestureRecognizer()..onTap = _openLink,
          ),
        ],
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          apiKeyInput,
          const SizedBox(height: 10),
          apiKeyLink,
        ],
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    const borderRadius = 50.0;
    return Container(
      margin: const EdgeInsets.all(40),
      decoration: _createShadowDecoration(borderRadius),
      child: GradientButton(
        onPressed: () => _onLoginButtonPressed(context),
        borderRadius: borderRadius,
        child: Container(
          padding: const EdgeInsets.all(25),
          constraints: const BoxConstraints(
            minWidth: 88.0,
            minHeight: 36.0,
          ),
          alignment: Alignment.center,
          child: const Text(
            "Login to Wakatime",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }

  Future<bool> _openLink() async => await launch(Constants.apiKeyUrl);

  void _onLoginButtonPressed(BuildContext context) async =>
      await context.read<LoginPageCubit>().login(apiKeyTextController.text);

  BoxDecoration _createShadowDecoration(double borderRadius) => BoxDecoration(
        color: AppColors.cardBGPrimary,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      );
}
