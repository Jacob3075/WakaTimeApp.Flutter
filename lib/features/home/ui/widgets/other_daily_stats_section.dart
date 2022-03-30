import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart" as app_colors;
import "package:waka_time_app/common/ui/widgets/stats_card.dart";

class OtherDailyStatsSection {
  final Summaries summaries;

  const OtherDailyStatsSection({
    required this.summaries,
  });

  List<Widget> call() => [
        Column(
          children: [
            _sectionHeader(),
            SizedBox(height: 12.h),
          ],
        ),
        ..._statCards(),
      ];

  Widget _sectionHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Other Daily Stats",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Details",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: app_colors.AppColors.accentText,
            ),
          )
        ],
      );

  Iterable<Widget> _statCards() => [
        Column(
          children: [
            StatsCard.valueAsText(
              gradient: app_colors.AppGradients.greenCyan,
              text: "Most Used Language",
              valueText: summaries.currentDay.languages.mostUsed.name,
              icon: AppAssets.icons.codeFile,
            ),
            SizedBox(height: 14.h),
          ],
        ),
        Column(
          children: [
            StatsCard.valueAsText(
              gradient: app_colors.AppGradients.blueCyan,
              text: "Most Used Editor",
              valueText: summaries.currentDay.editors.mostUsed.name,
              icon: AppAssets.icons.laptop,
            ),
            SizedBox(height: 14.h),
          ],
        ),
        StatsCard.valueAsText(
          gradient: app_colors.AppGradients.purpleCyanDark,
          text: "Most Used OS",
          valueText: summaries.currentDay.operatingSystems.mostUsed.name,
          icon: AppAssets.icons.code,
        ),
      ].map(_nestedPadding);

  Widget _nestedPadding(Widget child) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 12.w), child: child);
}
