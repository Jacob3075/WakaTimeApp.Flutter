import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/ui/widgets/loading_animation.dart";
import "package:waka_time_app/di/injection.dart";
import "package:waka_time_app/features/project_stats/domain/models/project_summaries.dart";
import "package:waka_time_app/features/project_stats/ui/bloc/detailed_project_stats_bloc.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/custom_app_bar.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/language_stats/language_stats_page.dart";
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
            // TODO: PERSIST TABS
            body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                TimeStatsPage(projectSummaries: projectSummaries),
                LanguageStatsPage(languages: projectSummaries.languagesUsed()),
                const Text("Page 3"),
                const Text("Page 4"),
                const Text("Page 5"),
              ],
            ),
          ),
        ),
      );

  Widget _onLoadingState() => const Scaffold(body: SafeArea(child: LoadingAnimation()));

  // TODO: ADD ERROR SCREEN
  Widget _onErrorSate(Errors errors) => Center(child: Text("ERROR: $errors"));
}
