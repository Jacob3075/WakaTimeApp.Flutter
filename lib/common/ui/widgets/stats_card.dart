import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart" as app_colors;
import "package:waka_time_app/common/ui/widgets/custom_ink_well_card.dart";

class StatsCard extends StatelessWidget {
  final app_colors.Gradient gradient;
  final String text;
  late final Widget valueWidget;
  final String icon;
  final double cardHeight;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  static TextStyle valueTextStyle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );

  // FIXME: IMPROVE HOW value AND valueWidget ARE HANDLED
  StatsCard({
    Key? key,
    required this.gradient,
    required this.text,
    required this.icon,
    valueWidget,
    value,
    cardHeight,
    borderRadius,
    padding,
    margin,
  })  : assert(value != null || valueWidget != null),
        assert(!(value != null && valueWidget != null)),
        padding = padding ?? EdgeInsets.symmetric(horizontal: 18.w),
        margin = margin ?? EdgeInsets.zero,
        borderRadius = borderRadius ?? BorderRadius.circular(20.r),
        cardHeight = cardHeight ?? 60.h,
        super(key: key) {
    if (value != null) {
      this.valueWidget = Text(
        value,
        style: valueTextStyle,
      );
    } else {
      this.valueWidget = valueWidget;
    }
  }

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
          width: double.infinity,
          height: cardHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  valueWidget,
                ],
              ),
              Positioned(
                child: SvgPicture.asset(
                  icon,
                  height: cardHeight,
                  width: cardHeight,
                ),
                left: 100.h,
              ),
            ],
          ),
        ),
      );
}
