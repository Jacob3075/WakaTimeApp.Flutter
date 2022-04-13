import "package:bloc_test/bloc_test.dart";
import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/mockito.dart";
import "package:waka_time_app/common/domain/errors/domain_errors.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/errors/network_errors.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/editor.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/domain/models/operating_system.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_stats.dart";
import "package:waka_time_app/features/project_stats/ui/bloc/detailed_project_stats_bloc.dart";

import "../../../../../mocks.mocks.dart";

typedef _E = DetailedProjectStatsEvent;
typedef _S = DetailedProjectStatsState;

main() {
  late DetailedProjectStatsBloc projectStatsBloc;
  late final MockGetProjectStatsUC getProjectStats;
  late final MockGetProjectDetailsUC getProjectDetails;
  late final MockUserAuthCubit userAuthCubit;

  setUpAll(() {
    getProjectStats = MockGetProjectStatsUC();
    getProjectDetails = MockGetProjectDetailsUC();
    userAuthCubit = MockUserAuthCubit();

    when(userAuthCubit.apiKey).thenReturn("");
  });

  setUp(() {
    projectStatsBloc = DetailedProjectStatsBloc(
      getProjectStats: getProjectStats,
      getProjectDetailsUC: getProjectDetails,
      userAuthCubit: userAuthCubit,
    );
  });

  group("When getting project details does not return any errors", () {
    late final Errors errors;
    late final ProjectStats projectSummaries;

    setUpAll(() {
      when(getProjectDetails(any)).thenAnswer(
        (_) async => Right(
          ProjectDetails(
            projectName: "Test Project",
            createdDate: DateTime.parse("2022-01-01"),
            lastHeartBeat: DateTime.parse("2022-01-10"),
            id: "id",
          ),
        ),
      );
    });

    blocTest(
      "and getting project stats does not return any errors, data loaded state is emitted correctly",
      setUp: () {
        projectSummaries = ProjectStats(
          dailyProjectStats: [],
          range: StatsRange(
            startDate: DateTime.now(),
            endDate: DateTime.now(),
          ),
          totalTime: Time.zero,
          operatingSystems: OperatingSystems([]),
          editors: Editors([]),
          languages: Languages([]),
        );

        when(getProjectStats(any)).thenAnswer((realInvocation) async => Right(projectSummaries));
      },
      build: () => projectStatsBloc,
      act: (DetailedProjectStatsBloc bloc) => bloc.add(const _E.loadData(projectName: "")),
      expect: () => [
        const _S.loading(),
        _S.dataLoaded(projectSummaries: projectSummaries),
      ],
    );

    blocTest(
      "and getting project stats returns an error, error state is emitted",
      setUp: () {
        errors = const Errors.networkError(NetworkErrors.noConnection());
        when(getProjectStats(any)).thenAnswer((realInvocation) async => Left(errors));
      },
      build: () => projectStatsBloc,
      act: (DetailedProjectStatsBloc bloc) => bloc.add(const _E.loadData(projectName: "")),
      expect: () => [
        const _S.loading(),
        _S.error(error: errors),
      ],
    );
  });

  group(
    "When getting project details returns an error",
    () {
      late final Errors error;

      blocTest(
        "When the error is multiple project details being returned, error state is emitted",
        setUp: () {
          error = const Errors.domainError(DomainErrors(errorMessage: ""));
          when(getProjectDetails(any)).thenAnswer((_) async => Left(error));
        },
        build: () => projectStatsBloc,
        act: (DetailedProjectStatsBloc bloc) => bloc.add(const _E.loadData(projectName: "")),
        expect: () => [
          const _S.loading(),
          _S.error(error: error),
        ],
      );
    },
  );
}
