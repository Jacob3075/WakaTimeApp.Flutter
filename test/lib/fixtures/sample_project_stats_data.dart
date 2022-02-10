import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";

const sampleProjectStatsJson = """{
  "available_branches": [
    "feature_modules",
    "master",
    "restructure",
    "room",
    "stable"
  ],
  "branches": [
  ],
  "cummulative_total": {
    "decimal": "149.62",
    "digital": "149:37",
    "seconds": 538637.85,
    "text": "149 hrs 37 mins"
  },
  "data": [
    {
      "branches": [
        {
          "decimal": "2.93",
          "digital": "2:56:42",
          "hours": 2,
          "minutes": 56,
          "name": "Unknown",
          "percent": 100,
          "seconds": 42,
          "text": "2 hrs 56 mins",
          "total_seconds": 10602.609
        }
      ],
      "categories": [
        {
          "decimal": "2.93",
          "digital": "2:56:42",
          "hours": 2,
          "minutes": 56,
          "name": "Coding",
          "percent": 100,
          "seconds": 42,
          "text": "2 hrs 56 mins",
          "total_seconds": 10602.609
        }
      ],
      "dependencies": [
      ],
      "editors": [
        {
          "decimal": "2.93",
          "digital": "2:56:42",
          "hours": 2,
          "minutes": 56,
          "name": "Android Studio",
          "percent": 100,
          "seconds": 42,
          "text": "2 hrs 56 mins",
          "total_seconds": 10602.609
        }
      ],
      "entities": [
        {
          "decimal": "0.80",
          "digital": "0:48:44",
          "hours": 0,
          "minutes": 48,
          "name": "/home/jacob/Projects/Android/Waka Time App/app/build.gradle.kts",
          "percent": 27.59,
          "seconds": 44,
          "text": "48 mins",
          "total_seconds": 2924.948,
          "type": "file"
        },
        {
          "decimal": "0.73",
          "digital": "0:44:21",
          "hours": 0,
          "minutes": 44,
          "name": "/home/jacob/Projects/Android/Waka Time App/app/src/main/java/com/jacob/wakatimeapp/MainActivity.kt",
          "percent": 25.1,
          "seconds": 21,
          "text": "44 mins",
          "total_seconds": 2661.221,
          "type": "file"
        },
        {
          "decimal": "0.42",
          "digital": "0:25:14",
          "hours": 0,
          "minutes": 25,
          "name": "/home/jacob/Projects/Android/Waka Time App/app/build.gradle",
          "percent": 14.29,
          "seconds": 14,
          "text": "25 mins",
          "total_seconds": 1514.749,
          "type": "file"
        }
      ],
      "grand_total": {
        "decimal": "2.93",
        "digital": "2:56",
        "hours": 2,
        "minutes": 56,
        "text": "2 hrs 56 mins",
        "total_seconds": 10602.609
      },
      "languages": [
        {
          "decimal": "2.27",
          "digital": "2:16:00",
          "hours": 2,
          "minutes": 16,
          "name": "Kotlin",
          "percent": 76.97,
          "seconds": 0,
          "text": "2 hrs 16 mins",
          "total_seconds": 8160.541
        },
        {
          "decimal": "0.62",
          "digital": "0:37:34",
          "hours": 0,
          "minutes": 37,
          "name": "Groovy",
          "percent": 21.26,
          "seconds": 34,
          "text": "37 mins",
          "total_seconds": 2254.391
        },
        {
          "decimal": "0.05",
          "digital": "0:03:07",
          "hours": 0,
          "minutes": 3,
          "name": "VimL",
          "percent": 1.77,
          "seconds": 7,
          "text": "3 mins",
          "total_seconds": 187.561
        },
        {
          "decimal": "0.00",
          "digital": "0:00:00",
          "hours": 0,
          "minutes": 0,
          "name": "XML",
          "percent": 0,
          "seconds": 0,
          "text": "0 secs",
          "total_seconds": 0.116
        }
      ],
      "machines": [
        {
          "decimal": "2.93",
          "digital": "2:56:42",
          "hours": 2,
          "machine_name_id": "9be42c1a-a73f-4642-a063-c1e06fdf1ac4",
          "minutes": 56,
          "name": "jacob-hp",
          "percent": 100,
          "seconds": 42,
          "text": "2 hrs 56 mins",
          "total_seconds": 10602.609
        }
      ],
      "operating_systems": [
        {
          "decimal": "2.93",
          "digital": "2:56:42",
          "hours": 2,
          "minutes": 56,
          "name": "Linux",
          "percent": 100,
          "seconds": 42,
          "text": "2 hrs 56 mins",
          "total_seconds": 10602.609
        }
      ],
      "range": {
        "date": "2021-08-30",
        "end": "2021-08-30T18:29:59Z",
        "start": "2021-08-29T18:30:00Z",
        "text": "Mon Aug 30th 2021",
        "timezone": "Asia/Kolkata"
      }
    },
    {
      "branches": [
        {
          "decimal": "5.12",
          "digital": "5:07:23",
          "hours": 5,
          "minutes": 7,
          "name": "master",
          "percent": 98.53,
          "seconds": 23,
          "text": "5 hrs 7 mins",
          "total_seconds": 18443.936
        },
        {
          "decimal": "0.07",
          "digital": "0:04:25",
          "hours": 0,
          "minutes": 4,
          "name": "Unknown",
          "percent": 1.42,
          "seconds": 25,
          "text": "4 mins",
          "total_seconds": 265.402
        },
        {
          "decimal": "0.00",
          "digital": "0:00:08",
          "hours": 0,
          "minutes": 0,
          "name": "stable",
          "percent": 0.05,
          "seconds": 8,
          "text": "8 secs",
          "total_seconds": 8.826
        }
      ],
      "categories": [
        {
          "decimal": "5.18",
          "digital": "5:11:58",
          "hours": 5,
          "minutes": 11,
          "name": "Coding",
          "percent": 100,
          "seconds": 58,
          "text": "5 hrs 11 mins",
          "total_seconds": 18718.164
        }
      ],
      "dependencies": [
      ],
      "editors": [
        {
          "decimal": "5.18",
          "digital": "5:11:58",
          "hours": 5,
          "minutes": 11,
          "name": "IntelliJ",
          "percent": 100,
          "seconds": 58,
          "text": "5 hrs 11 mins",
          "total_seconds": 18718.164
        }
      ],
      "entities": [
        {
          "decimal": "0.90",
          "digital": "0:54:09",
          "hours": 0,
          "minutes": 54,
          "name": "/home/jacob/Projects/Flutter/Waka Time App/lib/features/detailed_stats/by_project/ui/bloc/detailed_project_stats_bloc.dart",
          "percent": 17.36,
          "seconds": 9,
          "text": "54 mins",
          "total_seconds": 3249.504,
          "type": "file"
        },
        {
          "decimal": "0.00",
          "digital": "0:00:00",
          "hours": 0,
          "minutes": 0,
          "name": "/home/jacob/Projects/Flutter/Waka Time App/lib/features/home/domain/models/last_7_days_stats.freezed.dart",
          "percent": 0,
          "seconds": 0,
          "text": "0 secs",
          "total_seconds": 0.014,
          "type": "file"
        }
      ],
      "grand_total": {
        "decimal": "5.18",
        "digital": "5:11",
        "hours": 5,
        "minutes": 11,
        "text": "5 hrs 11 mins",
        "total_seconds": 18718.164
      },
      "languages": [
        {
          "decimal": "5.12",
          "digital": "5:07:43",
          "hours": 5,
          "minutes": 7,
          "name": "Dart",
          "percent": 98.64,
          "seconds": 43,
          "text": "5 hrs 7 mins",
          "total_seconds": 18463.615
        },
        {
          "decimal": "0.03",
          "digital": "0:02:42",
          "hours": 0,
          "minutes": 2,
          "name": "YAML",
          "percent": 0.87,
          "seconds": 42,
          "text": "2 mins",
          "total_seconds": 162.881
        },
        {
          "decimal": "0.00",
          "digital": "0:00:52",
          "hours": 0,
          "minutes": 0,
          "name": "textmate",
          "percent": 0.28,
          "seconds": 52,
          "text": "52 secs",
          "total_seconds": 52.503
        },
        {
          "decimal": "0.00",
          "digital": "0:00:39",
          "hours": 0,
          "minutes": 0,
          "name": "Java",
          "percent": 0.21,
          "seconds": 39,
          "text": "39 secs",
          "total_seconds": 39.165
        }
      ],
      "machines": [
        {
          "decimal": "5.18",
          "digital": "5:11:58",
          "hours": 5,
          "machine_name_id": "0a5bb74a-1877-46f1-aa72-950824d6dc3d",
          "minutes": 11,
          "name": "hp-notebook",
          "percent": 100,
          "seconds": 58,
          "text": "5 hrs 11 mins",
          "total_seconds": 18718.164
        }
      ],
      "operating_systems": [
        {
          "decimal": "5.18",
          "digital": "5:11:58",
          "hours": 5,
          "minutes": 11,
          "name": "Linux",
          "percent": 100,
          "seconds": 58,
          "text": "5 hrs 11 mins",
          "total_seconds": 18718.164
        }
      ],
      "range": {
        "date": "2022-01-12",
        "end": "2022-01-12T18:29:59Z",
        "start": "2022-01-11T18:30:00Z",
        "text": "Wed Jan 12th 2022",
        "timezone": "Asia/Kolkata"
      }
    }
  ],
  "end": "2022-01-12T18:29:59Z",
  "start": "2021-08-29T18:30:00Z"
}
""";

final sampleProjectStatsData = ProjectSummaries(
  totalTime: const Time(hours: 149, minutes: 37, decimal: 149.62),
  dailyProjectStats: [
    DailyProjectStats(
      timeSpent: const Time(hours: 2, minutes: 56, decimal: 2.93),
      entities: [],
      languages: Languages(
        const [
          Language(
            timeSpent: Time(
              decimal: 2.27,
              hours: 2,
              minutes: 16,
            ),
            name: "Kotlin",
            percent: 76.97,
          ),
          Language(
            timeSpent: Time(
              minutes: 37,
              hours: 0,
              decimal: 0.62,
            ),
            name: "Groovy",
            percent: 21.26,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.05,
              minutes: 3,
              hours: 0,
            ),
            name: "VimL",
            percent: 1.77,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.00,
              hours: 0,
              minutes: 0,
            ),
            name: "XML",
            percent: 0.0,
          )
        ],
      ),
      editors: [
        const Editor(
          timeSpent: Time(
            hours: 2,
            minutes: 56,
            decimal: 2.93,
          ),
          name: "Android Studio",
          percent: 100,
        )
      ],
      operatingSystems: [
        const OperatingSystem(
          timeSpent: Time(
            decimal: 2.93,
            hours: 2,
            minutes: 56,
          ),
          name: "Linux",
          percent: 100,
        )
      ],
      date: DateTime.parse("2021-08-30"),
    ),
    DailyProjectStats(
      timeSpent: const Time(hours: 5, minutes: 11, decimal: 5.18),
      entities: [],
      languages: Languages(
        const [
          Language(
            timeSpent: Time(
              decimal: 5.12,
              hours: 5,
              minutes: 7,
            ),
            name: "Dart",
            percent: 98.64,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.03,
              hours: 0,
              minutes: 2,
            ),
            name: "YAML",
            percent: 0.87,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.00,
              hours: 0,
              minutes: 0,
            ),
            name: "textmate",
            percent: 0.28,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.00,
              hours: 0,
              minutes: 0,
            ),
            name: "Java",
            percent: 0.21,
          ),
        ],
      ),
      editors: [
        const Editor(
          timeSpent: Time(
            hours: 5,
            minutes: 11,
            decimal: 5.18,
          ),
          name: "IntelliJ",
          percent: 100,
        )
      ],
      operatingSystems: [
        const OperatingSystem(
          timeSpent: Time(
            hours: 5,
            minutes: 11,
            decimal: 5.18,
          ),
          name: "Linux",
          percent: 100,
        )
      ],
      date: DateTime.parse("2022-01-12"),
    ),
  ],
  range: StatsRange(
    endDate: DateTime.parse("2022-01-12T18:29:59Z"),
    startDate: DateTime.parse("2021-08-29T18:30:00Z"),
  ),
);
