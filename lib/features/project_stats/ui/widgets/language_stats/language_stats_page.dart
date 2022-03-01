import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/ui/widgets/staggered_list_animation.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/language_stats/most_used_language_card.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/language_stats/other_languages_section.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/language_stats/time_spent_on_language_chart.dart";

class LanguageStatsPage extends StatefulWidget {
  final Languages languages;

  const LanguageStatsPage({Key? key, required this.languages}) : super(key: key);

  @override
  State<LanguageStatsPage> createState() => _LanguageStatsPageState();
}

class _LanguageStatsPageState extends State<LanguageStatsPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final otherLanguagesSection = OtherLanguagesSection(languages: widget.languages);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: StaggeredListAnimation(
        itemCount: widget.languages.values.length,
        getChild: (index) => index == 0 ? pageHeader() : otherLanguagesSection.listItem(index),
      ),
    );
  }

  Widget pageHeader() => Column(
        children: [
          TimeSpentOnLanguageChart(
            languages: widget.languages,
          ),
          MostUsedLanguageCard(languages: widget.languages),
          SizedBox(height: 24.h),
          OtherLanguagesSection.sectionHeader(),
        ],
      );

  @override
  bool get wantKeepAlive => true;
}
