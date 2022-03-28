import "package:flutter_test/flutter_test.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";

// FIXME: IMPROVE/FIX TESTS!!!!!!!!!
// https://wakatime.com/api/v1/users/current/summaries?start=2022-02-1&end=2022-03-23&project=Waka%20Time%20App&
main() {
  test("languages used function returns stats for all the languages used in the project", () {
    final testValues = [
      _createDailyProjectStats(
        const [
          Language(
            name: "L1",
            timeSpent: Time(hours: 2, minutes: 30, decimal: 2.5),
            percent: Percent(2.5, 6.75),
          ),
          Language(
            name: "L2",
            timeSpent: Time(hours: 1, minutes: 15, decimal: 1.25),
            percent: Percent(1.25, 6.75),
          ),
          Language(
            name: "L3",
            timeSpent: Time(hours: 3, minutes: 0, decimal: 3.0),
            percent: Percent(3, 6.75),
          ),
        ],
      ),
      _createDailyProjectStats(
        const [
          Language(
            name: "L1",
            timeSpent: Time(hours: 1, minutes: 15, decimal: 1.25),
            percent: Percent(1.25, 4.25),
          ),
          Language(
            name: "L2",
            timeSpent: Time(hours: 3, minutes: 0, decimal: 3.0),
            percent: Percent(3, 4.25),
          ),
        ],
      )
    ];
    final ProjectSummaries projectSummaries = _createProjectSummaries(testValues);
    expect(
      projectSummaries.languages,
      Languages(
        const [
          Language(
            name: "L2",
            timeSpent: Time(hours: 4, minutes: 15, decimal: 4.25),
            percent: Percent(4.25, 11),
          ),
          Language(
            name: "L1",
            timeSpent: Time(hours: 3, minutes: 45, decimal: 3.75),
            percent: Percent(3.75, 11),
          ),
          Language(
            name: "L3",
            timeSpent: Time(hours: 3, minutes: 0, decimal: 3.0),
            percent: Percent(3, 11),
          ),
        ],
      ),
    );
  });
}

DailyProjectStats _createDailyProjectStats(List<Language> languages) => DailyProjectStats(
      timeSpent: languages.map((e) => e.timeSpent).getTotalTime,
      entities: List.empty(),
      languages: Languages(languages),
      editors: Editors([]),
      operatingSystems: OperatingSystems([]),
      date: DateTime.now(),
    );

ProjectSummaries _createProjectSummaries(
  List<DailyProjectStats> dailyProjectStats,
) =>
    ProjectSummaries(
      totalTime: dailyProjectStats.map((e) => e.timeSpent).getTotalTime,
      dailyProjectStats: dailyProjectStats,
      range: StatsRange(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
      ),
      languages: Languages([]),
      editors: Editors([]),
      operatingSystems: OperatingSystems([]),
    );
