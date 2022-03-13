import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/animations.dart";
import "package:waka_time_app/common/ui/widgets/stats_card.dart";
import "package:waka_time_app/di/injection.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";
import "package:waka_time_app/features/home/ui/widgets/other_daily_stats_section.dart";
import "package:waka_time_app/features/home/ui/widgets/recent_projects_section.dart";
import "package:waka_time_app/features/home/ui/widgets/user_details_section.dart";
import "package:waka_time_app/features/home/ui/widgets/weekly_report_section.dart";

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
                  loading: () => Animations.loading(),
                  loaded: (data) => _buildUI(userDetails, data),
                  authError: () => _errorScreen(context),
                  error: (error) => _errorScreen(context, error),
                );
              },
            ),
          ),
        ),
      );

  Widget _buildUI(UserDetails userDetails, Summaries last7daysStats) => SingleChildScrollView(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),
              UserDetailsSection(userDetails: userDetails),
              SizedBox(height: 20.h),
              StatsCard.valueAsText(
                gradient: AppGradients.primary,
                text: "Total Time Spent\nToday",
                valueText: last7daysStats.currentDay.timeSpent.formattedPrint(),
                icon: AppAssets.icons.time,
                cardHeight: 72.h,
                borderRadius: BorderRadius.circular(16.r),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                margin: EdgeInsets.symmetric(horizontal: 12.w),
              ),
              SizedBox(height: 16.h),
              RecentProjectsSection(summaries: last7daysStats),
              SizedBox(height: 4.h),
              WeeklyReportSection(summaries: last7daysStats),
              SizedBox(height: 20.h),
              OtherDailyStatsSection(summaries: last7daysStats),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      );

  // TODO: ERROR SCREEN
  Widget _errorScreen(BuildContext context, [String? error]) => Container();
}
