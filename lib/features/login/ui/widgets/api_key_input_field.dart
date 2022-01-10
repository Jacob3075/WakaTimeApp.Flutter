import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class ApiKeyInputField extends StatelessWidget {
  final BoxDecoration decoration;

  final TextEditingController textController;

  final Future<bool> Function() onTap;

  const ApiKeyInputField({
    Key? key,
    required this.decoration,
    required this.textController,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const borderRadius = BorderRadius.all(Radius.circular(20.0));

    final apiKeyInput = Container(
      decoration: decoration,
      child: TextField(
        style: const TextStyle(color: Colors.white),
        controller: textController,
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
            recognizer: TapGestureRecognizer()..onTap = onTap,
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
}
