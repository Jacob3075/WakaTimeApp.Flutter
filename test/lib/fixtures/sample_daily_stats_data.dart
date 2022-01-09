import "package:waka_time_app/features/home/domain/models/daily_stats.dart";

const sampleEmptyDailyStatsDataJson = """
{
  "start": "2021-09-05T18:30:00Z",
  "end": "2021-09-07T18:29:59Z",
  "cummulative_total": {
    "decimal": "0.00",
    "digital": "0:00",
    "seconds": 0,
    "text": "0 secs"
  },
  "data": [
    {
      "categories": [],
      "dependencies": [],
      "editors": [],
      "grand_total": {
        "decimal": "0.00",
        "digital": "0:00",
        "hours": 0,
        "minutes": 0,
        "text": "0 secs",
        "total_seconds": 0
      },
      "languages": [],
      "machines": [],
      "operating_systems": [],
      "projects": [],
      "range": {
        "date": "2021-09-06",
        "end": "2021-09-06T18:29:59Z",
        "start": "2021-09-05T18:30:00Z",
        "text": "Mon Sep 6th 2021",
        "timezone": "Asia/Kolkata"
      }
    }
  ]
}
""";

final sampleEmptyDailyStatsData = DailyStats(
  date: DateTime.parse("2021-09-06"),
  timeSpent: const Time(
    hours: 0,
    minutes: 0,
    decimal: 0,
  ),
  projectsWorkedOn: [],
  mostUsedLanguage: "",
  mostUsedEditor: "",
  mostUsedOs: "",
);

const sampleDailyStatsDataJson = """
{
  "cummulative_total": {
    "decimal": "4.13",
    "digital": "4:08",
    "seconds": 14891.677,
    "text": "4 hrs 8 mins"
  },
  "data": [
    {
      "categories": [
        {
          "decimal": "4.13",
          "digital": "4:08:11",
          "hours": 4,
          "minutes": 8,
          "name": "Coding",
          "percent": 100,
          "seconds": 11,
          "text": "4 hrs 8 mins",
          "total_seconds": 14891.677
        }
      ],
      "dependencies": [
        {
          "decimal": "0.08",
          "digital": "0:05:21",
          "hours": 0,
          "minutes": 5,
          "name": "com.jacob",
          "percent": 16.01,
          "seconds": 21,
          "text": "5 mins",
          "total_seconds": 321.056
        },
        {
          "decimal": "0.07",
          "digital": "0:04:46",
          "hours": 0,
          "minutes": 4,
          "name": "libqtile",
          "percent": 14.27,
          "seconds": 46,
          "text": "4 mins",
          "total_seconds": 286.163
        },
        {
          "decimal": "0.03",
          "digital": "0:02:31",
          "hours": 0,
          "minutes": 2,
          "name": "retrofit2.Response",
          "percent": 7.54,
          "seconds": 31,
          "text": "2 mins",
          "total_seconds": 151.261
        }
      ],
      "editors": [
        {
          "decimal": "3.97",
          "digital": "3:58:04",
          "hours": 3,
          "minutes": 58,
          "name": "IntelliJ",
          "percent": 95.92,
          "seconds": 4,
          "text": "3 hrs 58 mins",
          "total_seconds": 14284.458
        },
        {
          "decimal": "0.17",
          "digital": "0:10:07",
          "hours": 0,
          "minutes": 10,
          "name": "Neovim",
          "percent": 4.08,
          "seconds": 7,
          "text": "10 mins",
          "total_seconds": 607.219
        }
      ],
      "grand_total": {
        "decimal": "4.13",
        "digital": "4:08",
        "hours": 4,
        "minutes": 8,
        "text": "4 hrs 8 mins",
        "total_seconds": 14891.677
      },
      "languages": [
        {
          "decimal": "3.62",
          "digital": "3:37:51",
          "hours": 3,
          "minutes": 37,
          "name": "Dart",
          "percent": 87.77,
          "seconds": 51,
          "text": "3 hrs 37 mins",
          "total_seconds": 13071.058
        },
        {
          "decimal": "0.07",
          "digital": "0:04:29",
          "hours": 0,
          "minutes": 4,
          "name": "YAML",
          "percent": 1.81,
          "seconds": 29,
          "text": "4 mins",
          "total_seconds": 269.247
        },
        {
          "decimal": "0.00",
          "digital": "0:00:03",
          "hours": 0,
          "minutes": 0,
          "name": "SVG",
          "percent": 0.02,
          "seconds": 3,
          "text": "3 secs",
          "total_seconds": 3.088
        }
      ],
      "machines": [
        {
          "decimal": "4.13",
          "digital": "4:08:11",
          "hours": 4,
          "machine_name_id": "660f14e9-fe1c-470c-a601-e836eeb7b8dd",
          "minutes": 8,
          "name": "hp-notebook",
          "percent": 100,
          "seconds": 11,
          "text": "4 hrs 8 mins",
          "total_seconds": 14891.677
        }
      ],
      "operating_systems": [
        {
          "decimal": "4.13",
          "digital": "4:08:11",
          "hours": 4,
          "minutes": 8,
          "name": "Linux",
          "percent": 100,
          "seconds": 11,
          "text": "4 hrs 8 mins",
          "total_seconds": 14891.677
        }
      ],
      "projects": [
        {
          "decimal": "3.93",
          "digital": "3:56:15",
          "hours": 3,
          "minutes": 56,
          "name": "Waka Time App",
          "percent": 95.85,
          "seconds": 15,
          "text": "3 hrs 56 mins",
          "total_seconds": 14175.196
        },
        {
          "decimal": "0.17",
          "digital": "0:10:07",
          "hours": 0,
          "minutes": 10,
          "name": "Unknown Project",
          "percent": 4.15,
          "seconds": 7,
          "text": "10 mins",
          "total_seconds": 607.219
        }
      ],
      "range": {
        "date": "2022-01-07",
        "end": "2022-01-07T18:29:59Z",
        "start": "2022-01-06T18:30:00Z",
        "text": "Today",
        "timezone": "Asia/Kolkata"
      }
    }
  ],
  "end": "2022-01-07T18:29:59Z",
  "start": "2022-01-06T18:30:00Z"
}
""";

final sampleDailyStatsData = DailyStats(
  date: DateTime.parse("2022-01-07"),
  timeSpent: const Time(
    hours: 4,
    minutes: 6,
    decimal: 4.1,
  ),
  projectsWorkedOn: const [
    Project(
      name: "Waka Time App",
      percent: 95.85,
      time: Time(
        decimal: 3.93,
        hours: 3,
        minutes: 56,
      ),
    ),
    Project(
      name: "Unknown Project",
      percent: 4.15,
      time: Time(
        decimal: 0.17,
        hours: 0,
        minutes: 10,
      ),
    )
  ],
  mostUsedLanguage: "Dart",
  mostUsedEditor: "IntelliJ",
  mostUsedOs: "Linux",
);
