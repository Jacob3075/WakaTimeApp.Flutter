import "package:flutter/material.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class CustomInkWellCard extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
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
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        decoration: decoration ?? const BoxDecoration(boxShadow: [AppShadows.cardShadow]),
        margin: margin,
        padding: padding,
        child: Material(
          borderRadius: borderRadius,
          color: containerColor ?? AppColors.cardBGPrimary,
          child: InkWell(
            splashColor: splashColor,
            borderRadius: borderRadius,
            onTap: onTap ?? () {},
            child: child,
          ),
        ),
      );
}
