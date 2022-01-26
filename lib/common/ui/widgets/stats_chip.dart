import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart" as app_colors;
import "package:waka_time_app/common/ui/widgets/custom_ink_well_card.dart";

class StatsChip extends StatelessWidget {
  final double height;
  final String title;
  final String value;
  final app_colors.Gradient gradient;
  final String icon;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;

  StatsChip({
    Key? key,
    required this.gradient,
    required this.title,
    required this.value,
    required this.icon,
    required this.borderRadius,
    height,
    margin,
    padding,
  })  : padding = padding ?? EdgeInsets.symmetric(horizontal: 12.w),
        margin = margin ?? EdgeInsets.zero,
        height = height ?? 82.h,
        super(key: key);

  @override
  Widget build(BuildContext context) => CustomInkWellCard(
        borderRadius: borderRadius,
        containerColor: Colors.transparent,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          boxShadow: const [app_colors.AppShadows.cardShadow],
          borderRadius: borderRadius,
          gradient: LinearGradient(colors: [gradient.startColor, gradient.endColor]),
        ),
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: SvgPicture.asset(
                  icon,
                  height: 50.r,
                  width: 50.r,
                ),
              )
            ],
          ),
        ),
      );
}
