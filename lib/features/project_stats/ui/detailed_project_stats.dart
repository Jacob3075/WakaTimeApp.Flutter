import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/ui/widgets/animations.dart";
import "package:waka_time_app/di/injection.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";
import "package:waka_time_app/features/project_stats/ui/bloc/detailed_project_stats_bloc.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/custom_app_bar.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/secondary_stats/secondary_stats_page.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/time_stats/time_stats_page.dart";

typedef _Event = DetailedProjectStatsEvent;

class DetailedProjectStats extends StatelessWidget {
  final String projectName;

  const DetailedProjectStats({
    Key? key,
    required this.projectName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            getIt<DetailedProjectStatsBloc>()..add(_Event.loadData(projectName: projectName)),
        child: BlocBuilder<DetailedProjectStatsBloc, DetailedProjectStatsState>(
          builder: (_, state) => state.when(
            loading: _onLoadingState,
            dataLoaded: (it) => _onDataLoadedState(it, context),
            error: _onErrorSate,
          ),
        ),
      );

  Widget _onDataLoadedState(ProjectSummaries projectSummaries, BuildContext context) => SafeArea(
        child: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: CustomAppBar(
              projectName: projectName,
              onPressed: () => context.router.pop(),
            ),
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                TimeStatsPage(projectSummaries: projectSummaries),
                SecondaryStatsPage.language(secondaryStats: projectSummaries.languages),
                // FIXME: NOT SHOWING 100%
                SecondaryStatsPage.operatingSystem(
                  secondaryStats: projectSummaries.operatingSystems,
                ),
                const Text("Page 4"),
                const Text("Page 5"),
              ],
            ),
          ),
        ),
      );

  Widget _onLoadingState() => Scaffold(body: SafeArea(child: Animations.loading()));

  // TODO: ADD ERROR SCREEN
  Widget _onErrorSate(Errors errors) => Center(child: Text("ERROR: $errors"));
}
