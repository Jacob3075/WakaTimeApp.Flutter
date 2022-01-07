import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";
import "package:waka_time_app/features/home/ui/widgets/time_spent_today_card.dart";
import "package:waka_time_app/features/home/ui/widgets/user_details_section.dart";
import "package:waka_time_app/injection_container.dart";

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: BlocProvider(
            create: (_) => getIt<HomePageCubit>(),
            child: BlocBuilder<HomePageCubit, HomePageState>(
              builder: (context, state) {
                final homePageCubit = context.read<HomePageCubit>();
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      SizedBox(height: 24.h),
                      UserDetailsSection(cubit: homePageCubit),
                      SizedBox(height: 28.h),
                      TimeSpentTodayCard(cubit: homePageCubit),
                      _recentProjects(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      );

  Widget _recentProjects() {
    return Container();
  }
}
