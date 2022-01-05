import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/errors.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/utils/constants.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/login/data/dtos/user_details_dto.dart";
import "package:waka_time_app/features/login/data/mappers/user_details_mapper.dart";

class LoginApi {
  final http.Client _client;

  LoginApi({required http.Client client}) : _client = client;

  Future<Either<Errors, UserDetails>> getUserDetails(String apiKey) async =>
      getDataOrErrorFromApi<UserDetails>(apiKey: apiKey, tryBody: _tryBody);

  Future<Either<Errors, UserDetails>> _tryBody(String apiKey) async {
    http.Response response = await _client.get(
      Uri.parse(
        "${Constants.wakaTimeApiUrl}/users/current?api_key=$apiKey",
      ),
    );
    return getDataOrErrorFromResponse<UserDetails>(
      response: response,
      successBody: _body,
    );
  }

  Either<Errors, UserDetails> _body(http.Response response) {
    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    final userDetailsDTO = UserDetailsDTO.fromJson(jsonMap);
    return Right(UserDetailsMapper().fromDto(userDetailsDTO));
  }
}
