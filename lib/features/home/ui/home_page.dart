import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";
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
                final userDetails = context.read<HomePageCubit>().userDetails;
                return state.when(
                  // TODO: LOADING SCREEN
                  loading: () => _buildUI(userDetails),
                  loaded: (data) => _buildUI(userDetails, data),
                  authError: () => _errorScreen(context),
                  error: (error) => _errorScreen(context, error),
                );
              },
            ),
          ),
        ),
      );

  Widget _buildUI(UserDetails userDetails, [DailyStats? dailyStats]) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 24.h),
            UserDetailsSection(userDetails: userDetails),
            SizedBox(height: 28.h),
            TimeSpentTodayCard(dailyStats: dailyStats),
            _recentProjects(),
          ],
        ),
      );

  Widget _recentProjects() {
    return Container();
  }

  // TODO: ERROR SCREEN
  Widget _errorScreen(BuildContext context, [String? error]) {
    // ScaffoldMessenger.of(context)
    //   ..hideCurrentSnackBar()
    //   ..showSnackBar(SnackBar(content: Text(error ?? "Error")));
    return Container();
  }
}
