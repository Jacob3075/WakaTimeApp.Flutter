import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/daily_stats.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/percent.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/domain/models/time.dart";

const sampleLast7DaysStatsDataJson = """{
  "cummulative_total": {
    "decimal": "34.15",
    "digital": "34:09",
    "seconds": 122978.334,
    "text": "34 hrs 9 mins"
  },
  "data": [
    {
      "categories": [
        {
          "decimal": "5.37",
          "digital": "5:22:45",
          "hours": 5,
          "minutes": 22,
          "name": "Coding",
          "percent": 100.0,
          "seconds": 45,
          "text": "5 hrs 22 mins",
          "total_seconds": 19365.136
        }
      ],
      "dependencies": [],
      "editors": [
        {
          "decimal": "5.33",
          "digital": "5:20:47",
          "hours": 5,
          "minutes": 20,
          "name": "IntelliJ",
          "percent": 99.39,
          "seconds": 47,
          "text": "5 hrs 20 mins",
          "total_seconds": 19247.811
        },
        {
          "decimal": "0.02",
          "digital": "0:01:57",
          "hours": 0,
          "minutes": 1,
          "name": "Neovim",
          "percent": 0.61,
          "seconds": 57,
          "text": "1 min",
          "total_seconds": 117.325
        }
      ],
      "grand_total": {
        "decimal": "5.37",
        "digital": "5:22",
        "hours": 5,
        "minutes": 22,
        "text": "5 hrs 22 mins",
        "total_seconds": 19365.136
      },
      "languages": [
        {
          "decimal": "5.30",
          "digital": "5:18:21",
          "hours": 5,
          "minutes": 18,
          "name": "Dart",
          "percent": 98.64,
          "seconds": 21,
          "text": "5 hrs 18 mins",
          "total_seconds": 19101.975
        },
        {
          "decimal": "0.05",
          "digital": "0:03:13",
          "hours": 0,
          "minutes": 3,
          "name": "YAML",
          "percent": 1.0,
          "seconds": 13,
          "text": "3 mins",
          "total_seconds": 193.571
        }
      ],
      "machines": [
        {
          "decimal": "5.37",
          "digital": "5:22:45",
          "hours": 5,
          "machine_name_id": "7c4a6acd-ead4-441b-9f17-35743861e703",
          "minutes": 22,
          "name": "hp-notebook",
          "percent": 100.0,
          "seconds": 45,
          "text": "5 hrs 22 mins",
          "total_seconds": 19365.136
        }
      ],
      "operating_systems": [
        {
          "decimal": "5.37",
          "digital": "5:22:45",
          "hours": 5,
          "minutes": 22,
          "name": "Linux",
          "percent": 100.0,
          "seconds": 45,
          "text": "5 hrs 22 mins",
          "total_seconds": 19365.136
        }
      ],
      "projects": [
        {
          "decimal": "5.25",
          "digital": "5:15:12",
          "hours": 5,
          "minutes": 15,
          "name": "Waka Time App",
          "percent": 97.66,
          "seconds": 12,
          "text": "5 hrs 15 mins",
          "total_seconds": 18912.731
        },
        {
          "decimal": "0.07",
          "digital": "0:04:39",
          "hours": 0,
          "minutes": 4,
          "name": "WakaTimeApp",
          "percent": 1.44,
          "seconds": 39,
          "text": "4 mins",
          "total_seconds": 279.204
        },
        {
          "decimal": "0.03",
          "digital": "0:02:53",
          "hours": 0,
          "minutes": 2,
          "name": "flutter-tdd-clean-architecture-course",
          "percent": 0.89,
          "seconds": 53,
          "text": "2 mins",
          "total_seconds": 173.201
        }
      ],
      "range": {
        "date": "2022-01-04",
        "end": "2022-01-04T18:29:59Z",
        "start": "2022-01-03T18:30:00Z",
        "text": "Tue Jan 4th 2022",
        "timezone": "Asia/Kolkata"
      }
    },
    {
      "categories": [
        {
          "decimal": "5.92",
          "digital": "5:55:12",
          "hours": 5,
          "minutes": 55,
          "name": "Coding",
          "percent": 100.0,
          "seconds": 12,
          "text": "5 hrs 55 mins",
          "total_seconds": 21312.396
        }
      ],
      "dependencies": [],
      "editors": [
        {
          "decimal": "5.87",
          "digital": "5:52:04",
          "hours": 5,
          "minutes": 52,
          "name": "IntelliJ",
          "percent": 99.12,
          "seconds": 4,
          "text": "5 hrs 52 mins",
          "total_seconds": 21124.831
        },
        {
          "decimal": "0.05",
          "digital": "0:03:07",
          "hours": 0,
          "minutes": 3,
          "name": "Neovim",
          "percent": 0.88,
          "seconds": 7,
          "text": "3 mins",
          "total_seconds": 187.565
        }
      ],
      "grand_total": {
        "decimal": "5.92",
        "digital": "5:55",
        "hours": 5,
        "minutes": 55,
        "text": "5 hrs 55 mins",
        "total_seconds": 21312.396
      },
      "languages": [
        {
          "decimal": "5.75",
          "digital": "5:45:30",
          "hours": 5,
          "minutes": 45,
          "name": "Dart",
          "percent": 97.27,
          "seconds": 30,
          "text": "5 hrs 45 mins",
          "total_seconds": 20730.314
        },
        {
          "decimal": "0.08",
          "digital": "0:05:58",
          "hours": 0,
          "minutes": 5,
          "name": "YAML",
          "percent": 1.68,
          "seconds": 58,
          "text": "5 mins",
          "total_seconds": 358.727
        }
      ],
      "machines": [
        {
          "decimal": "5.92",
          "digital": "5:55:12",
          "hours": 5,
          "machine_name_id": "30e635d4-4c09-496a-be79-12eda09dc71f",
          "minutes": 55,
          "name": "hp-notebook",
          "percent": 100.0,
          "seconds": 12,
          "text": "5 hrs 55 mins",
          "total_seconds": 21312.396
        }
      ],
      "operating_systems": [
        {
          "decimal": "5.92",
          "digital": "5:55:12",
          "hours": 5,
          "minutes": 55,
          "name": "Linux",
          "percent": 100.0,
          "seconds": 12,
          "text": "5 hrs 55 mins",
          "total_seconds": 21312.396
        }
      ],
      "projects": [
        {
          "decimal": "5.73",
          "digital": "5:44:30",
          "hours": 5,
          "minutes": 44,
          "name": "Waka Time App",
          "percent": 96.99,
          "seconds": 30,
          "text": "5 hrs 44 mins",
          "total_seconds": 20670.731
        },
        {
          "decimal": "0.12",
          "digital": "0:07:34",
          "hours": 0,
          "minutes": 7,
          "name": "WakaTimeApp",
          "percent": 2.13,
          "seconds": 34,
          "text": "7 mins",
          "total_seconds": 454.1
        },
        {
          "decimal": "0.05",
          "digital": "0:03:07",
          "hours": 0,
          "minutes": 3,
          "name": "Unknown Project",
          "percent": 0.88,
          "seconds": 7,
          "text": "3 mins",
          "total_seconds": 187.565
        }
      ],
      "range": {
        "date": "2022-01-05",
        "end": "2022-01-05T18:29:59Z",
        "start": "2022-01-04T18:30:00Z",
        "text": "Wed Jan 5th 2022",
        "timezone": "Asia/Kolkata"
      }
    },
    {
      "categories": [
        {
          "decimal": "7.48",
          "digital": "7:29:47",
          "hours": 7,
          "minutes": 29,
          "name": "Coding",
          "percent": 100.0,
          "seconds": 47,
          "text": "7 hrs 29 mins",
          "total_seconds": 26987.341
        }
      ],
      "dependencies": [
        {
          "decimal": "0.02",
          "digital": "0:01:10",
          "hours": 0,
          "minutes": 1,
          "name": "javax.inject",
          "percent": 20.0,
          "seconds": 10,
          "text": "1 min",
          "total_seconds": 70.664
        },
        {
          "decimal": "0.02",
          "digital": "0:01:10",
          "hours": 0,
          "minutes": 1,
          "name": "com.jacob",
          "percent": 20.0,
          "seconds": 10,
          "text": "1 min",
          "total_seconds": 70.664
        },
        {
          "decimal": "0.02",
          "digital": "0:01:10",
          "hours": 0,
          "minutes": 1,
          "name": "kotlinx.coroutines",
          "percent": 20.0,
          "seconds": 10,
          "text": "1 min",
          "total_seconds": 70.664
        },
        {
          "decimal": "0.02",
          "digital": "0:01:10",
          "hours": 0,
          "minutes": 1,
          "name": "android.content",
          "percent": 20.0,
          "seconds": 10,
          "text": "1 min",
          "total_seconds": 70.664
        },
        {
          "decimal": "0.02",
          "digital": "0:01:10",
          "hours": 0,
          "minutes": 1,
          "name": "timber.log",
          "percent": 20.0,
          "seconds": 10,
          "text": "1 min",
          "total_seconds": 70.664
        }
      ],
      "editors": [
        {
          "decimal": "7.47",
          "digital": "7:28:36",
          "hours": 7,
          "minutes": 28,
          "name": "IntelliJ",
          "percent": 99.74,
          "seconds": 36,
          "text": "7 hrs 28 mins",
          "total_seconds": 26916.677
        },
        {
          "decimal": "0.02",
          "digital": "0:01:10",
          "hours": 0,
          "minutes": 1,
          "name": "Neovim",
          "percent": 0.26,
          "seconds": 10,
          "text": "1 min",
          "total_seconds": 70.664
        }
      ],
      "grand_total": {
        "decimal": "7.48",
        "digital": "7:29",
        "hours": 7,
        "minutes": 29,
        "text": "7 hrs 29 mins",
        "total_seconds": 26987.341
      },
      "languages": [
        {
          "decimal": "6.98",
          "digital": "6:59:58",
          "hours": 6,
          "minutes": 59,
          "name": "Dart",
          "percent": 93.37,
          "seconds": 58,
          "text": "6 hrs 59 mins",
          "total_seconds": 25198.696
        },
        {
          "decimal": "0.28",
          "digital": "0:17:41",
          "hours": 0,
          "minutes": 17,
          "name": "YAML",
          "percent": 3.93,
          "seconds": 41,
          "text": "17 mins",
          "total_seconds": 1061.638
        }
      ],
      "machines": [
        {
          "decimal": "7.48",
          "digital": "7:29:47",
          "hours": 7,
          "machine_name_id": "30e635d4-4c09-496a-be79-12eda09dc71f",
          "minutes": 29,
          "name": "hp-notebook",
          "percent": 100.0,
          "seconds": 47,
          "text": "7 hrs 29 mins",
          "total_seconds": 26987.341
        }
      ],
      "operating_systems": [
        {
          "decimal": "7.48",
          "digital": "7:29:47",
          "hours": 7,
          "minutes": 29,
          "name": "Linux",
          "percent": 100.0,
          "seconds": 47,
          "text": "7 hrs 29 mins",
          "total_seconds": 26987.341
        }
      ],
      "projects": [
        {
          "decimal": "7.33",
          "digital": "7:20:04",
          "hours": 7,
          "minutes": 20,
          "name": "Waka Time App",
          "percent": 97.84,
          "seconds": 4,
          "text": "7 hrs 20 mins",
          "total_seconds": 26404.681
        },
        {
          "decimal": "0.13",
          "digital": "0:08:31",
          "hours": 0,
          "minutes": 8,
          "name": "WakaTimeApp",
          "percent": 1.9,
          "seconds": 31,
          "text": "8 mins",
          "total_seconds": 511.996
        },
        {
          "decimal": "0.02",
          "digital": "0:01:10",
          "hours": 0,
          "minutes": 1,
          "name": "Unknown Project",
          "percent": 0.26,
          "seconds": 10,
          "text": "1 min",
          "total_seconds": 70.664
        }
      ],
      "range": {
        "date": "2022-01-06",
        "end": "2022-01-06T18:29:59Z",
        "start": "2022-01-05T18:30:00Z",
        "text": "Thu Jan 6th 2022",
        "timezone": "Asia/Kolkata"
      }
    },
    {
      "categories": [
        {
          "decimal": "4.85",
          "digital": "4:51:46",
          "hours": 4,
          "minutes": 51,
          "name": "Coding",
          "percent": 100.0,
          "seconds": 46,
          "text": "4 hrs 51 mins",
          "total_seconds": 17506.667
        }
      ],
      "dependencies": [
        {
          "decimal": "0.10",
          "digital": "0:06:36",
          "hours": 0,
          "minutes": 6,
          "name": "com.jacob",
          "percent": 17.77,
          "seconds": 36,
          "text": "6 mins",
          "total_seconds": 396.975
        },
        {
          "decimal": "0.07",
          "digital": "0:04:46",
          "hours": 0,
          "minutes": 4,
          "name": "libqtile",
          "percent": 12.81,
          "seconds": 46,
          "text": "4 mins",
          "total_seconds": 286.163
        },
        {
          "decimal": "0.07",
          "digital": "0:04:46",
          "hours": 0,
          "minutes": 4,
          "name": "subprocess",
          "percent": 12.81,
          "seconds": 46,
          "text": "4 mins",
          "total_seconds": 286.163
        },
        {
          "decimal": "0.07",
          "digital": "0:04:46",
          "hours": 0,
          "minutes": 4,
          "name": "typing",
          "percent": 12.81,
          "seconds": 46,
          "text": "4 mins",
          "total_seconds": 286.163
        },
        {
          "decimal": "0.05",
          "digital": "0:03:47",
          "hours": 0,
          "minutes": 3,
          "name": "retrofit2.Response",
          "percent": 10.17,
          "seconds": 47,
          "text": "3 mins",
          "total_seconds": 227.18
        },
        {
          "decimal": "0.05",
          "digital": "0:03:47",
          "hours": 0,
          "minutes": 3,
          "name": "retrofit2.http",
          "percent": 10.17,
          "seconds": 47,
          "text": "3 mins",
          "total_seconds": 227.18
        },
        {
          "decimal": "0.02",
          "digital": "0:01:58",
          "hours": 0,
          "minutes": 1,
          "name": "coil.transform",
          "percent": 5.28,
          "seconds": 58,
          "text": "1 min",
          "total_seconds": 118.0
        },
        {
          "decimal": "0.02",
          "digital": "0:01:58",
          "hours": 0,
          "minutes": 1,
          "name": "android.content",
          "percent": 5.28,
          "seconds": 58,
          "text": "1 min",
          "total_seconds": 118.0
        },
        {
          "decimal": "0.02",
          "digital": "0:01:58",
          "hours": 0,
          "minutes": 1,
          "name": "coil.compose",
          "percent": 5.28,
          "seconds": 58,
          "text": "1 min",
          "total_seconds": 118.0
        },
        {
          "decimal": "0.02",
          "digital": "0:01:58",
          "hours": 0,
          "minutes": 1,
          "name": "androidx.compose",
          "percent": 5.28,
          "seconds": 58,
          "text": "1 min",
          "total_seconds": 118.0
        },
        {
          "decimal": "0.00",
          "digital": "0:00:51",
          "hours": 0,
          "minutes": 0,
          "name": "javax.inject",
          "percent": 2.32,
          "seconds": 51,
          "text": "51 secs",
          "total_seconds": 51.795
        }
      ],
      "editors": [
        {
          "decimal": "4.67",
          "digital": "4:40:23",
          "hours": 4,
          "minutes": 40,
          "name": "IntelliJ",
          "percent": 96.1,
          "seconds": 23,
          "text": "4 hrs 40 mins",
          "total_seconds": 16823.529
        },
        {
          "decimal": "0.18",
          "digital": "0:11:23",
          "hours": 0,
          "minutes": 11,
          "name": "Neovim",
          "percent": 3.9,
          "seconds": 23,
          "text": "11 mins",
          "total_seconds": 683.138
        }
      ],
      "grand_total": {
        "decimal": "4.85",
        "digital": "4:51",
        "hours": 4,
        "minutes": 51,
        "text": "4 hrs 51 mins",
        "total_seconds": 17506.667
      },
      "languages": [
        {
          "decimal": "4.33",
          "digital": "4:20:10",
          "hours": 4,
          "minutes": 20,
          "name": "Dart",
          "percent": 89.17,
          "seconds": 10,
          "text": "4 hrs 20 mins",
          "total_seconds": 15610.129
        },
        {
          "decimal": "0.22",
          "digital": "0:13:20",
          "hours": 0,
          "minutes": 13,
          "name": "Properties",
          "percent": 4.57,
          "seconds": 20,
          "text": "13 mins",
          "total_seconds": 800.726
        }
      ],
      "machines": [
        {
          "decimal": "4.85",
          "digital": "4:51:46",
          "hours": 4,
          "machine_name_id": "660f14e9-fe1c-470c-a601-e836eeb7b8dd",
          "minutes": 51,
          "name": "hp-notebook",
          "percent": 100.0,
          "seconds": 46,
          "text": "4 hrs 51 mins",
          "total_seconds": 17506.667
        }
      ],
      "operating_systems": [
        {
          "decimal": "4.85",
          "digital": "4:51:46",
          "hours": 4,
          "minutes": 51,
          "name": "Linux",
          "percent": 100.0,
          "seconds": 46,
          "text": "4 hrs 51 mins",
          "total_seconds": 17506.667
        }
      ],
      "projects": [
        {
          "decimal": "4.58",
          "digital": "4:35:49",
          "hours": 4,
          "minutes": 35,
          "name": "Waka Time App",
          "percent": 94.53,
          "seconds": 49,
          "text": "4 hrs 35 mins",
          "total_seconds": 16549.265
        },
        {
          "decimal": "0.18",
          "digital": "0:11:23",
          "hours": 0,
          "minutes": 11,
          "name": "Unknown Project",
          "percent": 3.9,
          "seconds": 23,
          "text": "11 mins",
          "total_seconds": 683.138
        },
        {
          "decimal": "0.07",
          "digital": "0:04:34",
          "hours": 0,
          "minutes": 4,
          "name": "WakaTimeApp",
          "percent": 1.57,
          "seconds": 34,
          "text": "4 mins",
          "total_seconds": 274.264
        }
      ],
      "range": {
        "date": "2022-01-07",
        "end": "2022-01-07T18:29:59Z",
        "start": "2022-01-06T18:30:00Z",
        "text": "Fri Jan 7th 2022",
        "timezone": "Asia/Kolkata"
      }
    },
    {
      "categories": [
        {
          "decimal": "2.35",
          "digital": "2:21:51",
          "hours": 2,
          "minutes": 21,
          "name": "Coding",
          "percent": 100.0,
          "seconds": 51,
          "text": "2 hrs 21 mins",
          "total_seconds": 8511.673
        }
      ],
      "dependencies": [
        {
          "decimal": "0.05",
          "digital": "0:03:51",
          "hours": 0,
          "minutes": 3,
          "name": "kotlinx.serialization",
          "percent": 41.85,
          "seconds": 51,
          "text": "3 mins",
          "total_seconds": 231.318
        },
        {
          "decimal": "0.03",
          "digital": "0:02:40",
          "hours": 0,
          "minutes": 2,
          "name": "com.jacob",
          "percent": 29.08,
          "seconds": 40,
          "text": "2 mins",
          "total_seconds": 160.721
        },
        {
          "decimal": "0.03",
          "digital": "0:02:40",
          "hours": 0,
          "minutes": 2,
          "name": "javax.inject",
          "percent": 29.08,
          "seconds": 40,
          "text": "2 mins",
          "total_seconds": 160.721
        }
      ],
      "editors": [
        {
          "decimal": "2.23",
          "digital": "2:14:06",
          "hours": 2,
          "minutes": 14,
          "name": "IntelliJ",
          "percent": 94.53,
          "seconds": 6,
          "text": "2 hrs 14 mins",
          "total_seconds": 8046.369
        },
        {
          "decimal": "0.12",
          "digital": "0:07:45",
          "hours": 0,
          "minutes": 7,
          "name": "Neovim",
          "percent": 5.47,
          "seconds": 45,
          "text": "7 mins",
          "total_seconds": 465.304
        }
      ],
      "grand_total": {
        "decimal": "2.35",
        "digital": "2:21",
        "hours": 2,
        "minutes": 21,
        "text": "2 hrs 21 mins",
        "total_seconds": 8511.673
      },
      "languages": [
        {
          "decimal": "2.23",
          "digital": "2:14:06",
          "hours": 2,
          "minutes": 14,
          "name": "Dart",
          "percent": 94.53,
          "seconds": 6,
          "text": "2 hrs 14 mins",
          "total_seconds": 8046.369
        },
        {
          "decimal": "0.12",
          "digital": "0:07:45",
          "hours": 0,
          "minutes": 7,
          "name": "Kotlin",
          "percent": 5.47,
          "seconds": 45,
          "text": "7 mins",
          "total_seconds": 465.304
        }
      ],
      "machines": [
        {
          "decimal": "2.35",
          "digital": "2:21:51",
          "hours": 2,
          "machine_name_id": "7c464efd-05f7-4d09-b55f-fb299fcd23ef",
          "minutes": 21,
          "name": "hp-notebook",
          "percent": 100.0,
          "seconds": 51,
          "text": "2 hrs 21 mins",
          "total_seconds": 8511.673
        }
      ],
      "operating_systems": [
        {
          "decimal": "2.35",
          "digital": "2:21:51",
          "hours": 2,
          "minutes": 21,
          "name": "Linux",
          "percent": 100.0,
          "seconds": 51,
          "text": "2 hrs 21 mins",
          "total_seconds": 8511.673
        }
      ],
      "projects": [
        {
          "decimal": "2.17",
          "digital": "2:10:49",
          "hours": 2,
          "minutes": 10,
          "name": "Waka Time App",
          "percent": 92.22,
          "seconds": 49,
          "text": "2 hrs 10 mins",
          "total_seconds": 7849.532
        },
        {
          "decimal": "0.12",
          "digital": "0:07:45",
          "hours": 0,
          "minutes": 7,
          "name": "Unknown Project",
          "percent": 5.47,
          "seconds": 45,
          "text": "7 mins",
          "total_seconds": 465.304
        },
        {
          "decimal": "0.05",
          "digital": "0:03:16",
          "hours": 0,
          "minutes": 3,
          "name": "WakaTimeApp",
          "percent": 2.31,
          "seconds": 16,
          "text": "3 mins",
          "total_seconds": 196.837
        }
      ],
      "range": {
        "date": "2022-01-08",
        "end": "2022-01-08T18:29:59Z",
        "start": "2022-01-07T18:30:00Z",
        "text": "Sat Jan 8th 2022",
        "timezone": "Asia/Kolkata"
      }
    },
    {
      "categories": [
        {
          "decimal": "2.10",
          "digital": "2:06:15",
          "hours": 2,
          "minutes": 6,
          "name": "Coding",
          "percent": 100.0,
          "seconds": 15,
          "text": "2 hrs 6 mins",
          "total_seconds": 7575.768
        }
      ],
      "dependencies": [
        {
          "decimal": "0.00",
          "digital": "0:00:23",
          "hours": 0,
          "minutes": 0,
          "name": "kotlinx.serialization",
          "percent": 49.77,
          "seconds": 23,
          "text": "23 secs",
          "total_seconds": 23.78
        },
        {
          "decimal": "0.00",
          "digital": "0:00:12",
          "hours": 0,
          "minutes": 0,
          "name": "javax.inject",
          "percent": 25.12,
          "seconds": 12,
          "text": "12 secs",
          "total_seconds": 12.0
        },
        {
          "decimal": "0.00",
          "digital": "0:00:12",
          "hours": 0,
          "minutes": 0,
          "name": "com.jacob",
          "percent": 25.12,
          "seconds": 12,
          "text": "12 secs",
          "total_seconds": 12.0
        }
      ],
      "editors": [
        {
          "decimal": "2.08",
          "digital": "2:05:09",
          "hours": 2,
          "minutes": 5,
          "name": "IntelliJ",
          "percent": 99.13,
          "seconds": 9,
          "text": "2 hrs 5 mins",
          "total_seconds": 7509.988
        },
        {
          "decimal": "0.02",
          "digital": "0:01:05",
          "hours": 0,
          "minutes": 1,
          "name": "Neovim",
          "percent": 0.87,
          "seconds": 5,
          "text": "1 min",
          "total_seconds": 65.78
        }
      ],
      "grand_total": {
        "decimal": "2.10",
        "digital": "2:06",
        "hours": 2,
        "minutes": 6,
        "text": "2 hrs 6 mins",
        "total_seconds": 7575.768
      },
      "languages": [
        {
          "decimal": "2.08",
          "digital": "2:05:09",
          "hours": 2,
          "minutes": 5,
          "name": "Dart",
          "percent": 99.13,
          "seconds": 9,
          "text": "2 hrs 5 mins",
          "total_seconds": 7509.988
        },
        {
          "decimal": "0.00",
          "digital": "0:00:35",
          "hours": 0,
          "minutes": 0,
          "name": "Kotlin",
          "percent": 0.47,
          "seconds": 35,
          "text": "35 secs",
          "total_seconds": 35.78
        }
      ],
      "machines": [
        {
          "decimal": "2.10",
          "digital": "2:06:15",
          "hours": 2,
          "machine_name_id": "30e635d4-4c09-496a-be79-12eda09dc71f",
          "minutes": 6,
          "name": "hp-notebook",
          "percent": 100.0,
          "seconds": 15,
          "text": "2 hrs 6 mins",
          "total_seconds": 7575.768
        }
      ],
      "operating_systems": [
        {
          "decimal": "2.10",
          "digital": "2:06:15",
          "hours": 2,
          "minutes": 6,
          "name": "Linux",
          "percent": 100.0,
          "seconds": 15,
          "text": "2 hrs 6 mins",
          "total_seconds": 7575.768
        }
      ],
      "projects": [
        {
          "decimal": "2.03",
          "digital": "2:02:07",
          "hours": 2,
          "minutes": 2,
          "name": "Waka Time App",
          "percent": 96.72,
          "seconds": 7,
          "text": "2 hrs 2 mins",
          "total_seconds": 7327.452
        },
        {
          "decimal": "0.05",
          "digital": "0:03:02",
          "hours": 0,
          "minutes": 3,
          "name": "WakaTimeApp",
          "percent": 2.41,
          "seconds": 2,
          "text": "3 mins",
          "total_seconds": 182.536
        },
        {
          "decimal": "0.02",
          "digital": "0:01:05",
          "hours": 0,
          "minutes": 1,
          "name": "Unknown Project",
          "percent": 0.87,
          "seconds": 5,
          "text": "1 min",
          "total_seconds": 65.78
        }
      ],
      "range": {
        "date": "2022-01-09",
        "end": "2022-01-09T18:29:59Z",
        "start": "2022-01-08T18:30:00Z",
        "text": "Yesterday",
        "timezone": "Asia/Kolkata"
      }
    },
    {
      "categories": [
        {
          "decimal": "6.02",
          "digital": "6:01:59",
          "hours": 6,
          "minutes": 1,
          "name": "Coding",
          "percent": 100.0,
          "seconds": 59,
          "text": "6 hrs 1 min",
          "total_seconds": 21719.353
        }
      ],
      "dependencies": [],
      "editors": [
        {
          "decimal": "6.02",
          "digital": "6:01:59",
          "hours": 6,
          "minutes": 1,
          "name": "IntelliJ",
          "percent": 100.0,
          "seconds": 59,
          "text": "6 hrs 1 min",
          "total_seconds": 21719.353
        }
      ],
      "grand_total": {
        "decimal": "6.02",
        "digital": "6:01",
        "hours": 6,
        "minutes": 1,
        "text": "6 hrs 1 min",
        "total_seconds": 21719.353
      },
      "languages": [
        {
          "decimal": "6.02",
          "digital": "6:01:59",
          "hours": 6,
          "minutes": 1,
          "name": "Dart",
          "percent": 100.0,
          "seconds": 59,
          "text": "6 hrs 1 min",
          "total_seconds": 21719.353
        }
      ],
      "machines": [
        {
          "decimal": "6.02",
          "digital": "6:01:59",
          "hours": 6,
          "machine_name_id": "30e635d4-4c09-496a-be79-12eda09dc71f",
          "minutes": 1,
          "name": "hp-notebook",
          "percent": 100.0,
          "seconds": 59,
          "text": "6 hrs 1 min",
          "total_seconds": 21719.353
        }
      ],
      "operating_systems": [
        {
          "decimal": "6.02",
          "digital": "6:01:59",
          "hours": 6,
          "minutes": 1,
          "name": "Linux",
          "percent": 100.0,
          "seconds": 59,
          "text": "6 hrs 1 min",
          "total_seconds": 21719.353
        }
      ],
      "projects": [
        {
          "decimal": "5.98",
          "digital": "5:59:27",
          "hours": 5,
          "minutes": 59,
          "name": "Waka Time App",
          "percent": 99.3,
          "seconds": 27,
          "text": "5 hrs 59 mins",
          "total_seconds": 21567.054
        },
        {
          "decimal": "0.03",
          "digital": "0:02:32",
          "hours": 0,
          "minutes": 2,
          "name": "WakaTimeApp",
          "percent": 0.7,
          "seconds": 32,
          "text": "2 mins",
          "total_seconds": 152.299
        }
      ],
      "range": {
        "date": "2022-01-10",
        "end": "2022-01-10T18:29:59Z",
        "start": "2022-01-09T18:30:00Z",
        "text": "Today",
        "timezone": "Asia/Kolkata"
      }
    }
  ],
  "end": "2022-01-10T18:29:59Z",
  "start": "2022-01-03T18:30:00Z"
}

""";

final sampleLast7DaysStats = Summaries(
  totalTime: Time(hours: 34, minutes: 9, decimal: 34.15),
  dailyStats: [
    DailyStats(
      timeSpent: Time(hours: 5, minutes: 22, decimal: 5.37),
      projectsWorkedOn: [
        Project(
          time: Time(hours: 5, minutes: 15, decimal: 5.25),
          name: "Waka Time App",
          percent: 97.66,
        ),
        Project(
          time: Time(hours: 0, minutes: 4, decimal: 0.07),
          name: "WakaTimeApp",
          percent: 1.44,
        ),
        Project(
          time: Time(hours: 0, minutes: 2, decimal: 0.03),
          name: "flutter-tdd-clean-architecture-course",
          percent: 0.89,
        )
      ],
      editors: Editors([
        Editor(
          timeSpent: Time(
            decimal: 5.33,
            hours: 5,
            minutes: 20,
          ),
          name: "IntelliJ",
          percent: Percent.zero,
        ),
        Editor(
          timeSpent: Time(
            decimal: 0.02,
            hours: 0,
            minutes: 1,
          ),
          name: "Neovim",
          percent: Percent.zero,
        )
      ]),
      languages: Languages(
        [
          Language(
            timeSpent: Time(
              decimal: 5.30,
              hours: 5,
              minutes: 18,
            ),
            name: "Dart",
            percent: Percent.zero,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.05,
              hours: 0,
              minutes: 3,
            ),
            name: "YAML",
            percent: Percent.zero,
          ),
        ],
      ),
      operatingSystems: OperatingSystems(
        [
          OperatingSystem(
            timeSpent: Time(
              decimal: 5.37,
              hours: 5,
              minutes: 22,
            ),
            name: "Linux",
            percent: Percent.zero,
          )
        ],
      ),
      date: DateTime.parse("2022-01-04"),
    ),
    DailyStats(
      timeSpent: Time(hours: 5, minutes: 55, decimal: 5.92),
      projectsWorkedOn: [
        Project(
          time: Time(hours: 5, minutes: 44, decimal: 5.73),
          name: "Waka Time App",
          percent: 96.99,
        ),
        Project(
          time: Time(hours: 0, minutes: 7, decimal: 0.12),
          name: "WakaTimeApp",
          percent: 2.13,
        ),
        Project(
          time: Time(hours: 0, minutes: 3, decimal: 0.05),
          name: "Unknown Project",
          percent: 0.88,
        )
      ],
      editors: Editors([
        Editor(
          timeSpent: Time(
            decimal: 5.87,
            hours: 5,
            minutes: 52,
          ),
          name: "IntelliJ",
          percent: Percent.zero,
        ),
        Editor(
          timeSpent: Time(
            decimal: 0.05,
            hours: 0,
            minutes: 3,
          ),
          name: "Neovim",
          percent: Percent.zero,
        )
      ]),
      languages: Languages(
        [
          Language(
            timeSpent: Time(
              decimal: 5.75,
              hours: 5,
              minutes: 45,
            ),
            name: "Dart",
            percent: Percent.zero,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.08,
              hours: 0,
              minutes: 5,
            ),
            name: "YAML",
            percent: Percent.zero,
          ),
        ],
      ),
      operatingSystems: OperatingSystems(
        [
          OperatingSystem(
            timeSpent: Time(
              decimal: 5.92,
              hours: 5,
              minutes: 55,
            ),
            name: "Linux",
            percent: Percent.zero,
          )
        ],
      ),
      date: DateTime.parse("2022-01-05"),
    ),
    DailyStats(
      timeSpent: Time(hours: 7, minutes: 29, decimal: 7.48),
      projectsWorkedOn: [
        Project(
          time: Time(hours: 7, minutes: 20, decimal: 7.33),
          name: "Waka Time App",
          percent: 97.84,
        ),
        Project(
          time: Time(hours: 0, minutes: 8, decimal: 0.13),
          name: "WakaTimeApp",
          percent: 1.9,
        ),
        Project(
          time: Time(hours: 0, minutes: 1, decimal: 0.02),
          name: "Unknown Project",
          percent: 0.26,
        )
      ],
      editors: Editors([
        Editor(
          timeSpent: Time(
            decimal: 7.47,
            hours: 7,
            minutes: 28,
          ),
          name: "IntelliJ",
          percent: Percent.zero,
        ),
        Editor(
          timeSpent: Time(
            decimal: 0.02,
            hours: 0,
            minutes: 1,
          ),
          name: "Neovim",
          percent: Percent.zero,
        )
      ]),
      languages: Languages(
        [
          Language(
            timeSpent: Time(
              decimal: 6.98,
              hours: 6,
              minutes: 59,
            ),
            name: "Dart",
            percent: Percent.zero,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.28,
              hours: 0,
              minutes: 17,
            ),
            name: "YAML",
            percent: Percent.zero,
          )
        ],
      ),
      operatingSystems: OperatingSystems(
        [
          OperatingSystem(
            timeSpent: Time(
              decimal: 7.48,
              hours: 7,
              minutes: 29,
            ),
            name: "Linux",
            percent: Percent.zero,
          )
        ],
      ),
      date: DateTime.parse("2022-01-06"),
    ),
    DailyStats(
      timeSpent: Time(hours: 4, minutes: 51, decimal: 4.85),
      projectsWorkedOn: [
        Project(
          time: Time(hours: 4, minutes: 35, decimal: 4.58),
          name: "Waka Time App",
          percent: 94.53,
        ),
        Project(
          time: Time(hours: 0, minutes: 11, decimal: 0.18),
          name: "Unknown Project",
          percent: 3.9,
        ),
        Project(
          time: Time(hours: 0, minutes: 4, decimal: 0.07),
          name: "WakaTimeApp",
          percent: 1.57,
        )
      ],
      editors: Editors([
        Editor(
          timeSpent: Time(
            decimal: 4.67,
            hours: 4,
            minutes: 40,
          ),
          name: "IntelliJ",
          percent: Percent.zero,
        ),
        Editor(
          timeSpent: Time(
            decimal: 0.18,
            hours: 0,
            minutes: 11,
          ),
          name: "Neovim",
          percent: Percent.zero,
        )
      ]),
      languages: Languages(
        [
          Language(
            timeSpent: Time(
              decimal: 4.33,
              hours: 4,
              minutes: 20,
            ),
            name: "Dart",
            percent: Percent.zero,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.22,
              hours: 0,
              minutes: 13,
            ),
            name: "Properties",
            percent: Percent.zero,
          )
        ],
      ),
      operatingSystems: OperatingSystems(
        [
          OperatingSystem(
            timeSpent: Time(
              decimal: 4.85,
              hours: 4,
              minutes: 51,
            ),
            name: "Linux",
            percent: Percent.zero,
          )
        ],
      ),
      date: DateTime.parse("2022-01-07"),
    ),
    DailyStats(
      timeSpent: Time(hours: 2, minutes: 21, decimal: 2.35),
      projectsWorkedOn: [
        Project(
          time: Time(hours: 2, minutes: 10, decimal: 2.17),
          name: "Waka Time App",
          percent: 92.22,
        ),
        Project(
          time: Time(hours: 0, minutes: 7, decimal: 0.12),
          name: "Unknown Project",
          percent: 5.47,
        ),
        Project(
          time: Time(hours: 0, minutes: 3, decimal: 0.05),
          name: "WakaTimeApp",
          percent: 2.31,
        )
      ],
      editors: Editors([
        Editor(
          timeSpent: Time(
            decimal: 2.23,
            hours: 2,
            minutes: 14,
          ),
          name: "IntelliJ",
          percent: Percent.zero,
        ),
        Editor(
          timeSpent: Time(
            decimal: 0.12,
            hours: 0,
            minutes: 7,
          ),
          name: "Neovim",
          percent: Percent.zero,
        )
      ]),
      languages: Languages(
        [
          Language(
            timeSpent: Time(
              decimal: 2.23,
              hours: 2,
              minutes: 14,
            ),
            name: "Dart",
            percent: Percent.zero,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.12,
              hours: 0,
              minutes: 7,
            ),
            name: "Kotlin",
            percent: Percent.zero,
          )
        ],
      ),
      operatingSystems: OperatingSystems(
        [
          OperatingSystem(
            timeSpent: Time(
              decimal: 2.35,
              hours: 2,
              minutes: 21,
            ),
            name: "Linux",
            percent: Percent.zero,
          )
        ],
      ),
      date: DateTime.parse("2022-01-08"),
    ),
    DailyStats(
      timeSpent: Time(hours: 2, minutes: 6, decimal: 2.1),
      projectsWorkedOn: [
        Project(
          time: Time(hours: 2, minutes: 2, decimal: 2.03),
          name: "Waka Time App",
          percent: 96.72,
        ),
        Project(
          time: Time(hours: 0, minutes: 3, decimal: 0.05),
          name: "WakaTimeApp",
          percent: 2.41,
        ),
        Project(
          time: Time(hours: 0, minutes: 1, decimal: 0.02),
          name: "Unknown Project",
          percent: 0.87,
        )
      ],
      editors: Editors([
        Editor(
          timeSpent: Time(
            decimal: 2.08,
            hours: 2,
            minutes: 5,
          ),
          name: "IntelliJ",
          percent: Percent.zero,
        ),
        Editor(
          timeSpent: Time(
            decimal: 0.02,
            hours: 0,
            minutes: 1,
          ),
          name: "Neovim",
          percent: Percent.zero,
        )
      ]),
      languages: Languages(
        [
          Language(
            timeSpent: Time(
              decimal: 2.08,
              hours: 2,
              minutes: 5,
            ),
            name: "Dart",
            percent: Percent.zero,
          ),
          Language(
            timeSpent: Time(
              decimal: 0.00,
              hours: 0,
              minutes: 0,
            ),
            name: "Kotlin",
            percent: Percent.zero,
          )
        ],
      ),
      operatingSystems: OperatingSystems(
        [
          OperatingSystem(
            timeSpent: Time(
              decimal: 2.10,
              hours: 2,
              minutes: 6,
            ),
            name: "Linux",
            percent: Percent.zero,
          )
        ],
      ),
      date: DateTime.parse("2022-01-09"),
    ),
    DailyStats(
      timeSpent: Time(hours: 6, minutes: 1, decimal: 6.02),
      projectsWorkedOn: [
        Project(
          time: Time(hours: 5, minutes: 59, decimal: 5.98),
          name: "Waka Time App",
          percent: 99.3,
        ),
        Project(
          time: Time(hours: 0, minutes: 2, decimal: 0.03),
          name: "WakaTimeApp",
          percent: 0.7,
        )
      ],
      editors: Editors([
        Editor(
          timeSpent: Time(
            decimal: 6.02,
            hours: 6,
            minutes: 1,
          ),
          name: "IntelliJ",
          percent: Percent.zero,
        )
      ]),
      languages: Languages(
        [
          Language(
            timeSpent: Time(
              decimal: 6.02,
              hours: 6,
              minutes: 1,
            ),
            name: "Dart",
            percent: Percent.zero,
          )
        ],
      ),
      operatingSystems: OperatingSystems(
        [
          OperatingSystem(
            timeSpent: Time(
              decimal: 6.02,
              hours: 6,
              minutes: 1,
            ),
            name: "Linux",
            percent: Percent.zero,
          )
        ],
      ),
      date: DateTime.parse("2022-01-10"),
    )
  ],
  range: StatsRange(
    startDate: DateTime.parse("2022-01-03T18:30:00Z"),
    endDate: DateTime.parse("2022-01-10T18:29:59Z"),
  ),
);
