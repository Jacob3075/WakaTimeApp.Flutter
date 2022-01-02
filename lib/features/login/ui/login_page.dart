import "package:flutter/material.dart";
import "package:waka_time_app/common/ui/gradient_button.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Wakatime Client",
                  style: TextStyle(
                    fontSize: 38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(40),
                child: GradientButton(
                  onPressed: () {},
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    constraints: const BoxConstraints(
                      minWidth: 88.0,
                      minHeight: 36.0,
                    ),
                    // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text(
                      "Login to Wakatime",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClick() async {}
}
