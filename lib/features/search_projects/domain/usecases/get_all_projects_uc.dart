import "dart:convert";

import "package:dartz/dartz.dart";
import "package:http/http.dart" as http;
import "package:injectable/injectable.dart";
import "package:waka_time_app/common/data/network/api_endpoints.dart";
import "package:waka_time_app/common/data/network/dtos/project_details_dto.dart";
import "package:waka_time_app/common/data/network/mappers/project_details_mapper.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/domain/usecases/base_use_case.dart";
import "package:waka_time_app/common/utils/extensions.dart";
import "package:waka_time_app/common/utils/utils.dart";

typedef _P = GetAllProjectsUCParameters;
typedef _R = Either<Errors, List<ProjectDetails>>;

@singleton
class GetAllProjectsUC extends BaseUseCase<_P, _R> {
  final http.Client _client;

  GetAllProjectsUC({required http.Client client}) : _client = client;

  @override
  call(_P parameters) async {
    List<ProjectDetails> result = List.empty(growable: true);
    int totalPages, currentPage;

    do {
      Either<Errors, _ResponseData> apiResponse = await _getApiData(parameters);

      if (apiResponse.isLeft()) return Left(apiResponse.getLeft()!);

      parameters = parameters.nextPage();
      _ResponseData _responseData = apiResponse.getRight()!;
      totalPages = _responseData.paginationData.totalPages;
      currentPage = _responseData.paginationData.currentPage;

      result.addAll(_responseData.data);
    } while (currentPage != totalPages);

    return Right(result);
  }

  Future<Either<Errors, _ResponseData>> _getApiData(_P parameters) => getDataOrErrorFromApi(
        apiCall: () => _apiCall(parameters),
        successResponseProcessing: _successResponseProcessing,
      );

  Future<http.Response> _apiCall(_P parameters) =>
      _client.get(ApiEndpoints.getAllProjects(parameters.apiKey, parameters.pageNumber));

  Either<Errors, _ResponseData> _successResponseProcessing(http.Response response) {
    final jsonMap = jsonDecode(response.body);
    final projectDetailsDTO = ProjectDetailsDTO.fromJson(jsonMap);
    final projectDetailsList = ProjectDetailsMapper().fromDto(projectDetailsDTO);
    final paginationData = _PaginationData(
      currentPage: projectDetailsDTO.page,
      totalPages: projectDetailsDTO.totalPages,
    );

    return Right(_ResponseData(data: projectDetailsList, paginationData: paginationData));
  }
}

class GetAllProjectsUCParameters extends BaseUseCaseParameters {
  final String apiKey;
  final int pageNumber;

  const GetAllProjectsUCParameters({required this.apiKey, this.pageNumber = 1});

  _P nextPage() => GetAllProjectsUCParameters(apiKey: apiKey, pageNumber: pageNumber + 1);
}

class _PaginationData {
  final int currentPage;
  final int totalPages;

  _PaginationData({required this.currentPage, required this.totalPages});
}

class _ResponseData {
  final List<ProjectDetails> data;
  final _PaginationData paginationData;

  _ResponseData({required this.data, required this.paginationData});
}
