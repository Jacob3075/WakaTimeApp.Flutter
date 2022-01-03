import "dart:convert";

import "package:http/http.dart" as http;
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/utils/constants.dart";
import "package:waka_time_app/features/login/data/dtos/user_details_dto.dart";
import "package:waka_time_app/features/login/data/mappers/user_details_mapper.dart";

class LoginApi {
  Future<UserDetails> testApiKey(String apiKey) async {
    http.Response response = await http.get(
      Uri.parse(
        "${Constants.wakaTimeApiUrl}/users/current?api_key=$apiKey",
      ),
    );

    if (response.statusCode != 200) throw Exception(response.body);

    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    final userDetailsDTO = UserDetailsDTO.fromJson(jsonMap);
    return UserDetailsMapper().fromDto(userDetailsDTO);
  }
}

abstract class EndpointUrls {
  static const userDetails = "";
// "${Constants.wakaTimeApiUrl}/users/current?api_key=$apiKey",
}
