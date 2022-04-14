import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/ui/widgets/animations.dart";
import "package:waka_time_app/common/ui/widgets/staggered_list_animation.dart";
import "package:waka_time_app/di/injection.dart";
import "package:waka_time_app/features/search_projects/ui/bloc/search_projects_bloc.dart";
import "package:waka_time_app/features/search_projects/ui/widgets/project_list_item.dart";

typedef _E = SearchProjectsEvent;

class SearchProjects extends StatelessWidget {
  const SearchProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (context) => getIt<SearchProjectsBloc>()..add(const _E.loadData()),
            child: BlocBuilder<SearchProjectsBloc, SearchProjectsState>(
              builder: (_, state) => state.when(
                loading: _onLoadingState,
                dataLoaded: (it) => _onDataLoadedState(it, context),
                error: _onErrorSate,
              ),
            ),
          ),
        ),
      );

  Widget _onDataLoadedState(List<ProjectDetails> projects, BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: StaggeredListAnimation(
          itemCount: projects.length,
          getChild: (int index) => ProjectListItem(project: projects[index]),
        ),
      );

  Widget _onLoadingState() => Animations.loading();

  Widget _onErrorSate(Errors error) => Animations.error();
}
