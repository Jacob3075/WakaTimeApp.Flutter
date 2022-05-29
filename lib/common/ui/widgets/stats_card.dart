import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart" as app_colors;
import "package:waka_time_app/common/ui/widgets/custom_ink_well_card.dart";

class StatsCard extends StatelessWidget {
  final String text;
  late final Widget valueWidget;
  final app_colors.Gradient gradient;
  final String icon;
  final double cardHeight;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  static TextStyle valueTextStyle = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.bold,
  );

  StatsCard.valueAsWidget({
    Key? key,
    required String text,
    required Widget valueWidget,
    required app_colors.Gradient gradient,
    required String icon,
    double? cardHeight,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) : this._(
          key: key,
          text: text,
          icon: icon,
          gradient: gradient,
          valueWidget: valueWidget,
          cardHeight: cardHeight,
          borderRadius: borderRadius,
          padding: padding,
          margin: margin,
        );

  StatsCard.valueAsText({
    Key? key,
    required String text,
    required String valueText,
    required app_colors.Gradient gradient,
    required String icon,
    double? cardHeight,
    BorderRadius? borderRadius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) : this._(
          key: key,
          text: text,
          icon: icon,
          gradient: gradient,
          valueWidget: Text(valueText, style: valueTextStyle),
          cardHeight: cardHeight,
          borderRadius: borderRadius,
          padding: padding,
          margin: margin,
        );

  StatsCard._({
    Key? key,
    required this.gradient,
    required this.text,
    required this.icon,
    required this.valueWidget,
    required double? cardHeight,
    required BorderRadius? borderRadius,
    required EdgeInsetsGeometry? padding,
    required EdgeInsetsGeometry? margin,
  })  : padding = padding ?? EdgeInsets.symmetric(horizontal: 18.w),
        margin = margin ?? EdgeInsets.zero,
        borderRadius = borderRadius ?? BorderRadius.circular(20.r),
        cardHeight = cardHeight ?? 60.h,
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
                left: 100.h,
                child: SvgPicture.asset(
                  icon,
                  height: cardHeight,
                  width: cardHeight,
                ),
              ),
            ],
          ),
        ),
      );
}
