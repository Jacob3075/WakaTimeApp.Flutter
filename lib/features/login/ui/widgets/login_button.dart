import "package:flutter/material.dart";
import "package:waka_time_app/common/ui/gradient_button.dart";

class LoginButton extends StatelessWidget {
  final Function(BuildContext context) onPressed;
  final BoxDecoration decoration;

  const LoginButton({
    Key? key,
    required this.onPressed,
    required this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.all(40),
        decoration: decoration,
        child: GradientButton(
          onPressed: () => onPressed(context),
          borderRadius: 50.0,
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
