import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/features/home/ui/widgets/recent_project_list_item.dart";

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
            ? SvgPicture.asset(
                AppAssets.illustrations.randomEmptyIllustration,
                height: 250.h,
              )
            : Column(
                children:
                    projects.take(3).map((item) => RecentProjectListItem(project: item)).toList(),
              ),
      );
}
