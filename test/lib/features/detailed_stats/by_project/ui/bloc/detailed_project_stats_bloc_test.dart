import "package:bloc_test/bloc_test.dart";
import "package:dartz/dartz.dart";
import "package:flutter_test/flutter_test.dart";
import "package:mockito/mockito.dart";
import "package:waka_time_app/common/domain/errors/domain_errors.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/errors/network_errors.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/features/detailed_stats/by_project/domain/models/project_details.dart";
import "package:waka_time_app/features/detailed_stats/by_project/ui/bloc/detailed_project_stats_bloc.dart";

import "../../../../../../mocks.mocks.dart";

typedef _Event = DetailedProjectStatsEvent;
typedef _State = DetailedProjectStatsState;

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
    late final Summaries summaries;

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
        summaries = Summaries(
          dailyStats: [],
          range: StatsRange(
            startDate: DateTime.now(),
            endDate: DateTime.now(),
          ),
          totalTime: const Time(
            hours: 0,
            minutes: 0,
            decimal: 0,
          ),
        );

        when(getProjectStats(any)).thenAnswer((realInvocation) async => Right(summaries));
      },
      build: () => projectStatsBloc,
      act: (DetailedProjectStatsBloc bloc) => bloc.add(const _Event.loadData(projectName: "")),
      expect: () => [
        const _State.loading(),
        _State.dataLoaded(projectStats: summaries),
      ],
    );

    blocTest(
      "and getting project stats returns an error, error state is emitted",
      setUp: () {
        errors = const Errors.networkError(networkError: NetworkErrors.network());
        when(getProjectStats(any)).thenAnswer((realInvocation) async => Left(errors));
      },
      build: () => projectStatsBloc,
      act: (DetailedProjectStatsBloc bloc) => bloc.add(const _Event.loadData(projectName: "")),
      expect: () => [
        const _State.loading(),
        _State.error(error: errors),
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
          error = const Errors.domainError(domainErrors: DomainErrors(errorMessage: ""));
          when(getProjectDetails(any)).thenAnswer((_) async => Left(error));
        },
        build: () => projectStatsBloc,
        act: (DetailedProjectStatsBloc bloc) => bloc.add(const _Event.loadData(projectName: "")),
        expect: () => [
          const _State.loading(),
          _State.error(error: error),
        ],
      );
    },
  );
}
