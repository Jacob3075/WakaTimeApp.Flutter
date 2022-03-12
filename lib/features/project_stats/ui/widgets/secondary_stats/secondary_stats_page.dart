import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart" as app_gradient;
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/staggered_list_animation.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/secondary_stats/most_used_secondary_stat_card.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/secondary_stats/other_secondary_stats_section.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/secondary_stats/time_spent_on_secondary_stats_chart.dart";

class SecondaryStatsPage extends StatefulWidget {
  final SecondaryStats secondaryStats;
  late final OtherSecondaryStatsSection otherSecondaryStatsSection;
  final app_gradient.Gradient gradient;
  final String icon;

  SecondaryStatsPage._({
    Key? key,
    required this.secondaryStats,
    required this.gradient,
    required this.icon,
  }) : super(key: key) {
    otherSecondaryStatsSection = OtherSecondaryStatsSection(secondaryStats: secondaryStats);
  }

  factory SecondaryStatsPage.language({
    required SecondaryStats secondaryStats,
  }) =>
      SecondaryStatsPage._(
        secondaryStats: secondaryStats,
        icon: AppAssets.icons.codeFile,
        gradient: AppGradients.greenCyan,
      );

  factory SecondaryStatsPage.operatingSystem({
    required SecondaryStats secondaryStats,
  }) =>
      SecondaryStatsPage._(
        secondaryStats: secondaryStats,
        icon: AppAssets.icons.laptop,
        gradient: AppGradients.purpleCyanDark,
      );

  @override
  _SecondaryStatsPageState createState() => _SecondaryStatsPageState();
}

class _SecondaryStatsPageState extends State<SecondaryStatsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) => super.build(context).let((_) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: StaggeredListAnimation(
          itemCount: widget.secondaryStats.values.length,
          getChild: (index) =>
              index == 0 ? pageHeader() : widget.otherSecondaryStatsSection.listItem(index),
        ),
      ));

  Widget pageHeader() => Column(
        children: [
          TimeSpentOnSecondaryStatsChart(
            secondaryStats: widget.secondaryStats,
          ),
          MostUsedSecondaryStatCard(
            secondaryStats: widget.secondaryStats,
            icon: widget.icon,
            gradient: widget.gradient,
          ),
          SizedBox(height: 18.h),
          widget.otherSecondaryStatsSection.sectionHeader(),
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
