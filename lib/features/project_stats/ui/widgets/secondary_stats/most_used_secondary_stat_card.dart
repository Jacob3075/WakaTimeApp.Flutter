import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart" as app_gradient;
import "package:waka_time_app/common/ui/widgets/stats_card.dart";

class MostUsedSecondaryStatCard extends StatelessWidget {
  late final SecondaryStat mostUsedSecondaryStat;
  final String icon;
  final app_gradient.Gradient gradient;

  MostUsedSecondaryStatCard({
    Key? key,
    required SecondaryStats secondaryStats,
    required this.gradient,
    required this.icon,
  }) : super(key: key) {
    mostUsedSecondaryStat = secondaryStats.mostUsed ?? SecondaryStat.none;
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: StatsCard.valueAsWidget(
          gradient: gradient,
          text: "Most Time\nSpent On",
          valueWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                mostUsedSecondaryStat.timeSpent.formattedPrint(),
                style: StatsCard.valueTextStyle,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${mostUsedSecondaryStat.name}, ",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "${mostUsedSecondaryStat.percent.value}%",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            ],
          ),
          icon: icon,
          cardHeight: 65.h,
          borderRadius: BorderRadius.circular(16.r),
        ),
      );
}
