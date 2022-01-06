import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";
import "package:waka_time_app/injection_container.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => getIt<HomePageCubit>(),
          child: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
