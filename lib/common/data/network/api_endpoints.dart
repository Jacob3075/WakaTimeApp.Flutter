import "package:waka_time_app/common/utils/constants.dart";

abstract class ApiEndpoints {
  static Uri getUserDetails(String apiKey) =>
      Uri.parse("${Constants.wakaTimeApiUrl}/users/current?api_key=$apiKey");

  static Uri getWeeklyStats(String apiKey) => Uri.parse(
      "${Constants.wakaTimeApiUrl}/users/current/summaries?range=last_7_days&api_key=$apiKey");

  static Uri getStatsForProject({
    required String apiKey,
    required String project,
    required String start,
    required String end,
  }) =>
      Uri.parse(
        "${Constants.wakaTimeApiUrl}/users/current/summaries?api_key=$apiKey&project=$project&start=$start&end=$end",
      );

  static Uri getProjectDetails(Map<String, dynamic> parameters) => Uri.parse(
        "${Constants.wakaTimeApiUrl}/users/current/projects?${_getQueryStringFromMap(parameters)}",
      );

  static Uri getAllProjects(String apiKey, int pageNumber) => Uri.parse(
        "${Constants.wakaTimeApiUrl}/users/current/projects?api_key=$apiKey&page=$pageNumber",
      );

  @Deprecated("Specify query parameters directly")
  static String _getQueryStringFromMap(Map<String, dynamic> parameters) =>
      parameters.entries.map((item) => "${item.key}=${item.value.toString()}").toList().join("&");
}
