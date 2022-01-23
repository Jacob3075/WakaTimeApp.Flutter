import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/routing/routes.gr.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/custom_ink_well_card.dart";

class RecentProjectsSection extends StatelessWidget {
  final Summaries summaries;

  const RecentProjectsSection({Key? key, required this.summaries}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            _buildSectionHeader(),
            SizedBox(height: 12.h),
            _buildProjectList(summaries.currentDay.projectsWorkedOn, context),
          ],
        ),
      );

  Widget _buildSectionHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recent Projects",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "See All",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.accentText,
            ),
          )
        ],
      );

  Widget _buildProjectList(List<Project> projects, BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: projects.isEmpty
            ? SvgPicture.asset(AppAssets.illustrations.randomEmptyIllustration)
            : Column(
                children:
                    projects.take(3).map((item) => _buildRecentProjectItem(item, context)).toList(),
              ),
      );

  Widget _buildRecentProjectItem(Project project, BuildContext context) {
    final borderRadius = BorderRadius.circular(20.r);
    return CustomInkWellCard(
      onTap: () => context.router.push(DetailedProjectStatsRoute(projectName: project.name)),
      borderRadius: borderRadius,
      margin: EdgeInsets.only(bottom: 15.h),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        boxShadow: const [AppShadows.cardShadow],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  project.time.formattedPrint(),
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SvgPicture.asset(AppAssets.icons.arrow)
          ],
        ),
      ),
    );
  }
}
