import "package:auto_route/auto_route.dart";
import "package:flutter/widgets.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:waka_time_app/common/domain/models/project_details.dart";
import "package:waka_time_app/common/ui/routing/routes.gr.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/custom_ink_well_card.dart";

class ProjectListItem extends StatelessWidget {
  ProjectListItem({Key? key, required this.project}) : super(key: key);

  final ProjectDetails project;
  final _borderRadius = BorderRadius.circular(20.r);

  @override
  Widget build(BuildContext context) => CustomInkWellCard(
        onTap: () =>
            context.router.push(DetailedProjectStatsRoute(projectName: project.projectName)),
        borderRadius: _borderRadius,
        margin: EdgeInsets.only(bottom: 15.h),
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          boxShadow: const [AppShadows.cardShadow],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 24.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                project.projectName,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SvgPicture.asset(AppAssets.icons.arrow)
            ],
          ),
        ),
      );
}
