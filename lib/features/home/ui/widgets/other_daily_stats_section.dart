import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_systems.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart" as app_colors;
import "package:waka_time_app/common/ui/widgets/stats_card.dart";

class OtherDailyStatsSection extends StatelessWidget {
  final Summaries summaries;

  const OtherDailyStatsSection({
    Key? key,
    required this.summaries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            _buildSectionHeader(),
            SizedBox(height: 12.h),
            _buildStatCards(),
          ],
        ),
      );

  Widget _buildSectionHeader() => Row(
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

  Widget _buildStatCards() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            StatsCard.valueAsText(
              gradient: app_colors.AppGradients.greenCyan,
              text: "Most Used Language",
              valueText:
                  summaries.currentDay.languages.mostUsed.getOrElse(() => Language.none).name,
              icon: AppAssets.icons.codeFile,
            ),
            SizedBox(height: 14.h),
            StatsCard.valueAsText(
              gradient: app_colors.AppGradients.blueCyan,
              text: "Most Used Editor",
              valueText: summaries.currentDay.mostUsedEditor.getOrElse(() => Editor.none).name,
              icon: AppAssets.icons.laptop,
            ),
            SizedBox(height: 14.h),
            StatsCard.valueAsText(
              gradient: app_colors.AppGradients.purpleCyanDark,
              text: "Most Used OS",
              valueText: summaries.currentDay.operatingSystems.mostUsed
                  .getOrElse(() => OperatingSystem.none)
                  .name,
              icon: AppAssets.icons.code,
            ),
          ],
        ),
      );
}
