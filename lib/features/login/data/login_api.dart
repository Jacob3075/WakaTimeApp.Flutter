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
  final http.Client client;

  LoginApi({required this.client});

  Future<UserDetails?> getUserDetails(String apiKey) async {
    http.Response response = await client.get(
      Uri.parse(
        "${Constants.wakaTimeApiUrl}/users/current?api_key=$apiKey",
      ),
    );

    final statusCode = response.statusCode;

    if (statusCode.isBetween(200, 299)) {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      final userDetailsDTO = UserDetailsDTO.fromJson(jsonMap);
      return UserDetailsMapper().fromDto(userDetailsDTO);
    } else if (statusCode == 401) {
    } else if (statusCode.isBetween(400, 499)) {}
  }

  Future<Either<Errors, UserDetails>> getUserDetails1(String apiKey) async =>
      getDataOrErrorFromApi<UserDetails>(apiKey: apiKey, tryBody: _tryBody);

  Future<Either<Errors, UserDetails>> _tryBody(String apiKey) async {
    http.Response response = await client.get(
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
