import "package:waka_time_app/common/utils/constants.dart";

abstract class ApiEndpoints {
  static Uri getDailyStats(String apiKey) =>
      Uri.parse("${Constants.wakaTimeApiUrl}/users/current/summaries?range=today&api_key=$apiKey");

  static Uri getUserDetails(String apiKey) =>
      Uri.parse("${Constants.wakaTimeApiUrl}/users/current?api_key=$apiKey");

  static Uri getWeeklyStats(String apiKey) => Uri.parse(
      "${Constants.wakaTimeApiUrl}/users/current/summaries?range=last_7_days&api_key=$apiKey");
}
