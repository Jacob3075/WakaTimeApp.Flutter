import "package:waka_time_app/common/domain/models/project_details.dart";

const sampleSingleProjectDetailsJson = """{
  "data": [
    {
      "badge": null,
      "created_at": "2021-08-30T06:13:00Z",
      "has_public_url": false,
      "human_readable_last_heartbeat_at": "Jan 14, 2022, 10:31 AM IST",
      "id": "93c2eb5d-5a78-4f8c-b8a7-e10e3cf77ebf",
      "last_heartbeat_at": "2022-01-14T05:01:40Z",
      "name": "Waka Time App",
      "repository": {
        "badge": null,
        "created_at": "2021-11-03T07:02:59Z",
        "default_branch": "master",
        "description": null,
        "fork_count": 0,
        "full_name": "Jacob3075/WakaTimeApp",
        "homepage": null,
        "html_url": "https://github.com/Jacob3075/WakaTimeApp",
        "id": "a455919c-0bbf-4bd7-8272-c8eb289d5619",
        "image_icon_url": "https://wakatime.com/static/img/integrations/github.png",
        "is_fork": false,
        "is_private": false,
        "last_synced_at": null,
        "modified_at": "2022-01-12T06:42:47Z",
        "name": "WakaTimeApp",
        "provider": "github",
        "star_count": 0,
        "url": "https://api.github.com/repos/Jacob3075/WakaTimeApp",
        "urlencoded_name": "WakaTimeApp",
        "wakatime_project_name": "Waka Time App",
        "watch_count": 0
      },
      "url": "/projects/Waka%20Time%20App",
      "urlencoded_name": "Waka%20Time%20App"
    }
  ],
  "next_page": 1,
  "page": 1,
  "prev_page": 1,
  "total": 2,
  "total_pages": 1
}
""";

final sampleSingleProjectDetails = ProjectDetails(
  id: "93c2eb5d-5a78-4f8c-b8a7-e10e3cf77ebf",
  projectName: "Waka Time App",
  createdDate: DateTime.parse("2021-08-30T06:13:00Z"),
  lastHeartBeat: DateTime.parse("2022-01-14T05:01:40Z"),
);

const sampleMultipleProjectsDetailsJson = """{
  "data": [
    {
      "badge": null,
      "created_at": "2021-08-30T06:13:00Z",
      "has_public_url": false,
      "human_readable_last_heartbeat_at": "Jan 14, 2022, 10:31 AM IST",
      "id": "93c2eb5d-5a78-4f8c-b8a7-e10e3cf77ebf",
      "last_heartbeat_at": "2022-01-14T05:01:40Z",
      "name": "Waka Time App",
      "repository": {
        "badge": null,
        "created_at": "2021-11-03T07:02:59Z",
        "default_branch": "master",
        "description": null,
        "fork_count": 0,
        "full_name": "Jacob3075/WakaTimeApp",
        "homepage": null,
        "html_url": "https://github.com/Jacob3075/WakaTimeApp",
        "id": "a455919c-0bbf-4bd7-8272-c8eb289d5619",
        "image_icon_url": "https://wakatime.com/static/img/integrations/github.png",
        "is_fork": false,
        "is_private": false,
        "last_synced_at": null,
        "modified_at": "2022-01-12T06:42:47Z",
        "name": "WakaTimeApp",
        "provider": "github",
        "star_count": 0,
        "url": "https://api.github.com/repos/Jacob3075/WakaTimeApp",
        "urlencoded_name": "WakaTimeApp",
        "wakatime_project_name": "Waka Time App",
        "watch_count": 0
      },
      "url": "/projects/Waka%20Time%20App",
      "urlencoded_name": "Waka%20Time%20App"
    },
    {
      "badge": null,
      "created_at": "2022-01-02T09:28:47Z",
      "has_public_url": false,
      "human_readable_last_heartbeat_at": "Jan 11, 2022, 1:15 PM IST",
      "id": "f24c37f3-01ed-4b89-afae-c8bd4119a9f5",
      "last_heartbeat_at": "2022-01-11T07:45:25Z",
      "name": "WakaTimeApp",
      "repository": null,
      "url": "/projects/WakaTimeApp",
      "urlencoded_name": "WakaTimeApp"
    }
  ],
  "next_page": 1,
  "page": 1,
  "prev_page": 1,
  "total": 2,
  "total_pages": 1
}
""";

final sampleMultipleProjectsDetails = [
  ProjectDetails(
    id: "93c2eb5d-5a78-4f8c-b8a7-e10e3cf77ebf",
    projectName: "Waka Time App",
    createdDate: DateTime.parse("2021-08-30T06:13:00Z"),
    lastHeartBeat: DateTime.parse("2022-01-14T05:01:40Z"),
  ),
  ProjectDetails(
    id: "f24c37f3-01ed-4b89-afae-c8bd4119a9f5",
    projectName: "WakaTimeApp",
    createdDate: DateTime.parse("2022-01-02T09:28:47Z"),
    lastHeartBeat: DateTime.parse("2022-01-11T07:45:25Z"),
  )
];

const sampleEmptyProjectDetailsJson = """{
  "data": [],
  "next_page": 1,
  "page": 1,
  "prev_page": 1,
  "total": 0,
  "total_pages": 1
}
""";
