import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/features/home/domain/models/daily_stats.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";
import "package:waka_time_app/features/home/ui/widgets/other_daily_stats_section.dart";
import "package:waka_time_app/features/home/ui/widgets/recent_projects_section.dart";
import "package:waka_time_app/features/home/ui/widgets/time_spent_today_card.dart";
import "package:waka_time_app/features/home/ui/widgets/user_details_section.dart";
import "package:waka_time_app/features/home/ui/widgets/weekly_report_section.dart";
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

  Widget _buildUI(UserDetails userDetails, [DailyStats? dailyStats]) => SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              UserDetailsSection(userDetails: userDetails),
              SizedBox(height: 20.h),
              TimeSpentTodayCard(dailyStats: dailyStats),
              SizedBox(height: 16.h),
              RecentProjectsSection(dailyStats: dailyStats),
              SizedBox(height: 4.h),
              const WeeklyReportSection(),
              SizedBox(height: 20.h),
              OtherDailyStatsSection(dailyStats: dailyStats),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );

  // TODO: ERROR SCREEN
  Widget _errorScreen(BuildContext context, [String? error]) => Container();
}
