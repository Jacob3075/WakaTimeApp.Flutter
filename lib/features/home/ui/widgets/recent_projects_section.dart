import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/routing/routes.gr.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/features/home/ui/widgets/recent_project_list_item.dart";

class RecentProjectsSection {
  final Summaries _summaries;
  final BuildContext _context;

  const RecentProjectsSection({
    required Summaries summaries,
    required BuildContext context,
  })  : _summaries = summaries,
        _context = context;

  List<Widget> call() => [
        Column(
          children: [
            _sectionHeader(),
            SizedBox(height: 12.h),
          ],
        ),
        ..._getItems().map(_nestedPadding).toList(),
      ];

  Widget _sectionHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Recent Projects",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            child: Text(
              "See All",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: AppColors.accentText,
              ),
            ),
            onTap: _seeAllProjects,
          )
        ],
      );

  List<Widget> _getItems() {
    final projectsWorkedOn = _summaries.currentDay.projectsWorkedOn;
    return projectsWorkedOn.isEmpty
        ? [
            SvgPicture.asset(
              AppAssets.illustrations.randomEmptyIllustration,
              height: 250.h,
            )
          ]
        : projectsWorkedOn.take(3).map((item) => RecentProjectListItem(project: item)).toList();
  }

  Widget _nestedPadding(Widget child) =>
      Padding(padding: EdgeInsets.symmetric(horizontal: 12.w), child: child);

  _seeAllProjects() => _context.router.push(const SearchProjectsRoute());
}
