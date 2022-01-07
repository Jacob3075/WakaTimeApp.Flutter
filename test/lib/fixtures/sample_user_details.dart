import "package:waka_time_app/common/domain/models/user_details.dart";

final sampleUserDetailsJson = """{
  "bio": "abc",
  "email": "jacob.bosco3075@gmail.com",
  "id": "0ace2da6-e00b-4441-ae74-7638ad8fb5ad",
  "timeout": 15,
  "timezone": "Asia/Kolkata",
  "username": "Jacob3075",
  "displayName": "Jacob",
  "lastProject": "WakaTimeApp",
  "fullName": "Jacob",
  "durationsSliceBy": "Language",
  "createdAt": "2020-05-18T13:28:23Z",
  "dateFormat": "YYYY-MM-DD",
  "photoUrl": "https://wakatime.com/photo/6718342a-2e14-4b77-8f65-a04226794b98?s=420"
}
"""
    .replaceAll("\n", "")
    .replaceAll(" ", "");

const sampleUserDetails = UserDetails(
  bio: "abc",
  email: "jacob.bosco3075@gmail.com",
  id: "0ace2da6-e00b-4441-ae74-7638ad8fb5ad",
  timeout: 15,
  timezone: "Asia/Kolkata",
  username: "Jacob3075",
  displayName: "Jacob",
  lastProject: "WakaTimeApp",
  fullName: "Jacob",
  durationsSliceBy: "Language",
  createdAt: "2020-05-18T13:28:23Z",
  dateFormat: "YYYY-MM-DD",
  photoUrl: "https://wakatime.com/photo/6718342a-2e14-4b77-8f65-a04226794b98?s=420",
);

const sampleUserDetailsResponse = """
{
 "data": {
    "bio": "abc",
    "city": null,
    "color_scheme": "Dark",
    "created_at": "2020-05-18T13:28:23Z",
    "date_format": "YYYY-MM-DD",
    "default_dashboard_range": "Last 7 Days",
    "display_name": "Jacob",
    "durations_slice_by": "Language",
    "email": "jacob.bosco3075@gmail.com",
    "full_name": "Jacob",
    "has_premium_features": false,
    "human_readable_website": "",
    "id": "0ace2da6-e00b-4441-ae74-7638ad8fb5ad",
    "is_email_confirmed": true,
    "is_email_public": false,
    "is_hireable": false,
    "is_onboarding_finished": true,
    "languages_used_public": true,
    "last_heartbeat_at": "2022-01-06T05:25:46Z",
    "last_plugin": "wakatime/v1.32.1 (linux-5.15.12-arch1-1-unknown) go1.17.5 idea/2021.3.1 idea-wakatime/13.1.8",
    "last_plugin_name": "IntelliJ",
    "last_project": "WakaTimeApp",
    "location": "",
    "logged_time_public": true,
    "modified_at": null,
    "needs_payment_method": false,
    "photo": "https://wakatime.com/photo/6718342a-2e14-4b77-8f65-a04226794b98",
    "photo_public": true,
    "plan": "basic",
    "profile_url": "https://wakatime.com/@Jacob3075",
    "profile_url_escaped": "https://wakatime.com/@Jacob3075",
    "public_email": null,
    "public_profile_time_range": "last_7_days",
    "share_all_time_badge": true,
    "show_machine_name_ip": false,
    "time_format_24hr": false,
    "time_format_display": "text",
    "timeout": 15,
    "timezone": "Asia/Kolkata",
    "username": "Jacob3075",
    "website": "",
    "weekday_start": 0,
    "writes_only": false
  }
}
""";
