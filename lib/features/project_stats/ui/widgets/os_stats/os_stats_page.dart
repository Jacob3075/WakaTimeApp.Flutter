import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/operating_systems.dart";
import "package:waka_time_app/common/ui/widgets/staggered_list_animation.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_spent_on_secondary_stats_chart.dart";

class OsStatsPage extends StatefulWidget {
  const OsStatsPage({Key? key, required this.operatingSystems}) : super(key: key);

  final OperatingSystems operatingSystems;

  @override
  State<OsStatsPage> createState() => _OsStatsPageState();
}

class _OsStatsPageState extends State<OsStatsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    // final otherLanguagesSection = OtherLanguagesSection(languages: widget.languages);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: StaggeredListAnimation(
        itemCount: widget.operatingSystems.values.length,
        // getChild: (index) => index == 0 ? pageHeader() : otherLanguagesSection.listItem(index),
        getChild: (index) => index == 0 ? pageHeader() : Container(),
      ),
    );
  }

  Widget pageHeader() => Column(
        children: [
          TimeSpentOnSecondaryStatsChart<OperatingSystem>(
            secondaryStats: widget.operatingSystems,
          ),
          // MostUsedLanguageCard(languages: widget.operatingSystems),
          SizedBox(height: 24.h),
          // OtherLanguagesSection.sectionHeader(),
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
