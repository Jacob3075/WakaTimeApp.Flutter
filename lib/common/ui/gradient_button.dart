import "package:flutter/material.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.child,
    this.startColor,
    this.endColor,
    required this.onPressed,
    required this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final Color? startColor;
  final Color? endColor;
  final Function() onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                startColor ?? AppGradients.primary.startColor,
                endColor ?? AppGradients.primary.endColor
              ],
            ),
            borderRadius: const BorderRadius.all(Radius.circular(80.0)),
          ),
          child: child,
        ),
      );
}
