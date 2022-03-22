import "package:flutter_test/flutter_test.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";

// FIXME: IMPROVE/FIX TESTS!!!!!!!!!
main() {
  test("languages used function returns stats for all the languages used in the project", () {
    final dailyProjectStats = DailyProjectStats(
      timeSpent: Time.zero,
      entities: List.empty(),
      languages: Languages(
        const [
          language1a,
          language2a,
          language3a,
          language1a,
          language1b,
          language2b,
        ],
      ),
      editors: Editors([]),
      operatingSystems: OperatingSystems([]),
      date: DateTime.now(),
    );
    final ProjectSummaries projectSummaries = ProjectSummaries(
      totalTime: const Time(hours: 27, minutes: 0, decimal: 27),
      dailyProjectStats: [dailyProjectStats, dailyProjectStats],
      range: StatsRange(
        startDate: DateTime.now(),
        endDate: DateTime.now(),
      ),
    );
    expect(
      projectSummaries.languages,
      Languages(
        const [
          Language(
            name: "L1",
            timeSpent: Time(hours: 12, minutes: 30, decimal: 12.5),
            percent: 46.3,
          ),
          Language(
            name: "L2",
            timeSpent: Time(hours: 8, minutes: 30, decimal: 8.5),
            percent: 31.48,
          ),
          Language(
            name: "L3",
            timeSpent: Time(hours: 6, minutes: 0, decimal: 6.0),
            percent: 22.22,
          ),
        ],
      ),
    );
  });
}

const language1a = Language(
  name: "L1",
  timeSpent: Time(hours: 2, minutes: 30, decimal: 2.5),
  percent: 18.52,
);
const language1b = Language(
  name: "L1",
  timeSpent: Time(hours: 1, minutes: 15, decimal: 1.25),
  percent: 9.26,
);
const language2a = Language(
  name: "L2",
  timeSpent: Time(hours: 1, minutes: 15, decimal: 1.25),
  percent: 9.26,
);
const language2b = Language(
  name: "L2",
  timeSpent: Time(hours: 3, minutes: 0, decimal: 3.0),
  percent: 22.22,
);
const language3a = Language(
  name: "L3",
  timeSpent: Time(hours: 3, minutes: 0, decimal: 3.0),
  percent: 22.22,
);

final editor1a = Editor(name: "E1", timeSpent: Time.fromDecimal(1.5), percent: 80);
final editor1b = Editor(name: "E1", timeSpent: Time.fromDecimal(1.0), percent: 80);

final editor2a = Editor(name: "E2", timeSpent: Time.fromDecimal(0.5), percent: 20);
final editor2b = Editor(name: "E2", timeSpent: Time.fromDecimal(3.5), percent: 20);
