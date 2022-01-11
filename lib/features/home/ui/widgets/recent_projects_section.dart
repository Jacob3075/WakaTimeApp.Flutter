import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/ui/custom_ink_well_card.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/features/home/domain/models/last_7_days_stats.dart";

class RecentProjectsSection extends StatelessWidget {
  final Last7DaysStats? last7DaysStats;

  const RecentProjectsSection({Key? key, this.last7DaysStats}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            _buildSectionHeader(),
            SizedBox(height: 12.h),
            _buildProjectList(last7DaysStats?.currentDay.projectsWorkedOn ?? List.empty()),
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

  Widget _buildProjectList(List<Project> projects) {
    final projectCards = projects.take(3).map((item) => _buildRecentProjectItem(item)).toList();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Column(children: projectCards),
    );
  }

  Widget _buildRecentProjectItem(Project project) {
    final borderRadius = BorderRadius.circular(20.r);
    return CustomInkWellCard(
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
