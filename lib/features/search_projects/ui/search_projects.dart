import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:waka_time_app/common/domain/errors/errors.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/di/injection.dart";
import "package:waka_time_app/features/search_projects/ui/bloc/search_projects_bloc.dart";

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

  Widget _onLoadingState() => const Text("LOADING");

  Widget _onDataLoadedState(List<ProjectDetails> projects, BuildContext context) =>
      ListView.builder(
        itemCount: projects.length,
        itemBuilder: (BuildContext context, int index) => Text(projects[index].projectName),
      );

  Widget _onErrorSate(Errors error) => Text(error.getErrorMessage());
}
