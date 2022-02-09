import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/utils.dart";
import "package:waka_time_app/features/login/data/dtos/user_details_dto.dart";
import "package:waka_time_app/features/login/data/mappers/user_details_mapper.dart";

typedef GetUserDetailsUCReturn = Future<Either<Errors, UserDetails>>;

@singleton
class GetUserDetailsUC extends BaseUseCase<GetUserDetailsUCParameters, GetUserDetailsUCReturn> {
  final http.Client _client;

  GetUserDetailsUC({required http.Client client}) : _client = client;

  @override
  call(GetUserDetailsUCParameters parameters) async => getDataOrErrorFromApi<UserDetails>(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(GetUserDetailsUCParameters parameters) async =>
      _client.get(ApiEndpoints.getUserDetails(parameters.apiKey));

  Either<Errors, UserDetails> _successResponseProcessing(
    http.Response response,
  ) {
    Map<String, dynamic> jsonMap = jsonDecode(response.body);
    final userDetailsDTO = UserDetailsDTO.fromJson(jsonMap);
    return Right(UserDetailsMapper().fromDto(userDetailsDTO));
  }
}

class GetUserDetailsUCParameters extends BaseUseCaseParameters {
  final String apiKey;

  const GetUserDetailsUCParameters({required this.apiKey}) : super();
}
