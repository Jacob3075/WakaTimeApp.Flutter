import "package:flutter/material.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class CustomInkWellCard extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final Color? containerColor;
  final Color? splashColor;
  final BoxDecoration? decoration;

  final Function()? onTap;

  const CustomInkWellCard({
    Key? key,
    required this.child,
    this.borderRadius,
    this.margin,
    this.containerColor,
    this.splashColor,
    this.decoration,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      margin: margin,
      child: Material(
        borderRadius: borderRadius,
        color: containerColor ?? AppColors.cardBGPrimary,
        child: InkWell(
          splashColor: splashColor,
          borderRadius: borderRadius,
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
