import "package:flutter/material.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/language_stats/other_languages_section.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/language_stats/time_spent_on_language_chart.dart";

class LanguageStatsPage extends StatelessWidget {
  final List<Language> languages;

  const LanguageStatsPage({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimeSpentOnLanguageChart(
          languages: languages,
        ),
        _mostUsedLanguage(),
        OtherLanguagesSection(languages: languages),
      ],
    );
  }

  Widget _mostUsedLanguage() => Container();
}
