import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:url_launcher/url_launcher.dart";
import "package:waka_time_app/common/ui/gradient_button.dart";
import "package:waka_time_app/common/ui/theme/colors.dart";
import "package:waka_time_app/common/utils/constants.dart";
import "package:waka_time_app/features/login/data/login_api.dart";

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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _appTitle(),
              _apiKeyInputSection(),
              _loginButton(),
            ],
          ),
        ),
      ),
    );
  }

  Padding _appTitle() => const Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "Wakatime Client",
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w500,
          ),
        ),
      );

  Padding _loginButton() => Padding(
        padding: const EdgeInsets.all(40),
        child: GradientButton(
          onPressed: onLoginButtonPressed,
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

  Widget _apiKeyInputSection() {
    const borderRadius = BorderRadius.all(Radius.circular(20));
    final apiKeyInput = Container(
      decoration: const BoxDecoration(
        color: AppColors.cardBGPrimary,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            offset: Offset(0, 4),
          )
        ],
      ),
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
            recognizer: TapGestureRecognizer()..onTap = openLink,
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

  Future<bool> openLink() async => await launch(Constants.apiKeyUrl);

  void onLoginButtonPressed() async {
    final userDetails = await LoginApi.testApiKey(apiKeyTextController.text);
    print(userDetails);
  }
}
