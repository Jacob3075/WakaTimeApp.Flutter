import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:waka_time_app/common/data/network/errors.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/utils/constants.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/login/data/dtos/user_details_dto.dart";
import "package:waka_time_app/features/login/data/mappers/user_details_mapper.dart";

class LoginApi {
  final http.Client _client;

  LoginApi({required http.Client client}) : _client = client;

  Future<Either<Errors, UserDetails>> getUserDetails(String apiKey) async =>
      getDataOrErrorFromApi<UserDetails>(
        apiCall: () => _apiCall(apiKey),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(String apiKey) async => _client.get(
        Uri.parse(
          "${Constants.wakaTimeApiUrl}/users/current?api_key=$apiKey",
        ),
      );

  Either<Errors, UserDetails> _successResponseProcessing(
    http.Response response,
  ) {
    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    final userDetailsDTO = UserDetailsDTO.fromJson(jsonMap);
    return Right(UserDetailsMapper().fromDto(userDetailsDTO));
  }
}
