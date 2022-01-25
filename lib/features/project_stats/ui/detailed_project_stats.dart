import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/widgets/loading_animation.dart";
import "package:waka_time_app/di/injection.dart";
import "package:waka_time_app/features/project_stats/ui/bloc/detailed_project_stats_bloc.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/custom_app_bar.dart";

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

  Widget _onDataLoadedState(Summaries projectStats, BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: CustomAppBar(projectName: projectName),
          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              Text("Page 1"),
              Text("Page 2"),
              Text("Page 3"),
              Text("Page 4"),
              Text("Page 5"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _onLoadingState() => const Scaffold(
        body: SafeArea(
          child: LoadingAnimation(),
        ),
      );

  // TODO: ADD ERROR SCREEN
  Widget _onErrorSate(Errors errors) => Center(child: Text("ERROR: $errors"));
}
