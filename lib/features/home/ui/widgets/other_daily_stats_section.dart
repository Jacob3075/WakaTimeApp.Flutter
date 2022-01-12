import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:waka_time_app/common/domain/models/summaries.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart" as app_colors;
import "package:waka_time_app/common/ui/widgets/custom_ink_well_card.dart";

class OtherDailyStatsSection extends StatelessWidget {
  final Summaries summaries;

  const OtherDailyStatsSection({
    Key? key,
    required this.summaries,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            _buildSectionHeader(),
            SizedBox(height: 12.h),
            _buildStatCards(),
          ],
        ),
      );

  Widget _buildSectionHeader() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Other Daily Stats",
            style: TextStyle(
              fontSize: 28.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Details",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.normal,
              color: app_colors.AppColors.accentText,
            ),
          )
        ],
      );

  Widget _buildStatCards() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            _buildStatsCard(
              gradient: app_colors.AppGradients.greenCyan,
              statCategory: "Most Used Language",
              value: summaries.currentDay.mostUsedLanguage,
              icon: AppAssets.icons.codeFile,
            ),
            SizedBox(height: 14.h),
            _buildStatsCard(
              gradient: app_colors.AppGradients.blueCyan,
              statCategory: "Most Used Editor",
              value: summaries.currentDay.mostUsedEditor,
              icon: AppAssets.icons.laptop,
            ),
            SizedBox(height: 14.h),
            _buildStatsCard(
              gradient: app_colors.AppGradients.purpleCyanDark,
              statCategory: "Most Used OS",
              value: summaries.currentDay.mostUsedOs,
              icon: AppAssets.icons.code,
            ),
          ],
        ),
      );

  Widget _buildStatsCard({
    required app_colors.Gradient gradient,
    required String statCategory,
    required String value,
    required String icon,
  }) =>
      CustomInkWellCard(
        borderRadius: BorderRadius.circular(20.r),
        containerColor: Colors.transparent,
        decoration: BoxDecoration(
          boxShadow: const [app_colors.AppShadows.cardShadow],
          borderRadius: BorderRadius.circular(20.r),
          gradient: LinearGradient(colors: [gradient.startColor, gradient.endColor]),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.w),
          width: double.infinity,
          height: 60.h,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    statCategory,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Positioned(
                child: SvgPicture.asset(
                  icon,
                  height: 60.h,
                  width: 60.h,
                ),
                left: 100.h,
              ),
            ],
          ),
        ),
      );
}
