import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:waka_time_app/features/detailed_stats/by_project/ui/bloc/detailed_project_stats_bloc.dart";
import "package:waka_time_app/injection_container.dart";

class DetailedProjectStats extends StatelessWidget {
  final String projectName;

  const DetailedProjectStats({
    Key? key,
    required this.projectName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DetailedProjectStatsBloc>(),
      child: BlocBuilder<DetailedProjectStatsBloc, DetailedProjectStatsState>(
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }
}
