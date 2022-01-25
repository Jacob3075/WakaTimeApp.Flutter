import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/widgets/loading_animation.dart";
import "package:waka_time_app/di/injection.dart";
import "package:waka_time_app/features/project_stats/ui/bloc/detailed_project_stats_bloc.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/header_section.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/stats_pager.dart";

typedef _Event = DetailedProjectStatsEvent;

class DetailedProjectStats extends StatelessWidget {
  final String projectName;

  const DetailedProjectStats({
    Key? key,
    required this.projectName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) =>
              getIt<DetailedProjectStatsBloc>()..add(_Event.loadData(projectName: projectName)),
          child: BlocBuilder<DetailedProjectStatsBloc, DetailedProjectStatsState>(
            builder: (_, state) => state.when(
              loading: _onLoadingState,
              dataLoaded: (it) => _onDataLoadedState(it, context),
              error: _onErrorSate,
            ),
          ),
        ),
      ),
    );
  }

  Widget _onDataLoadedState(Summaries projectStats, BuildContext context) => Column(
        children: [
          SizedBox(height: 20.h),
          HeaderSection(
            projectName: projectName,
            onClick: () => context.router.pop(),
          ),
          const StatsPager(),
        ],
      );

  Widget _onLoadingState() => const LoadingAnimation();

  // TODO: ADD ERROR SCREEN
  Widget _onErrorSate(Errors errors) => Center(child: Text("ERROR: $errors"));
}
