import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class CustomInkWellCard extends StatelessWidget {
  final Widget child;
  final BorderRadius? borderRadius;
  final double? margin;
  final Color? containerColor;
  final Color? splashColor;
  final BoxDecoration? decoration;

  const CustomInkWellCard({
    Key? key,
    required this.child,
    this.borderRadius,
    this.margin,
    this.containerColor,
    this.splashColor,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      margin: EdgeInsets.only(bottom: margin ?? 0.h),
      child: Material(
        borderRadius: borderRadius,
        color: containerColor ?? AppColors.cardBGPrimary,
        child: InkWell(
          splashColor: splashColor ?? Colors.white10,
          borderRadius: borderRadius,
          onTap: () {},
          child: child,
        ),
      ),
    );
  }
}
