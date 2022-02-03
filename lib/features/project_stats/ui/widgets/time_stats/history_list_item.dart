import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/custom_ink_well_card.dart";
import "package:waka_time_app/features/project_stats/domain/models/daily_project_stats.dart";

class HistoryListItem extends StatelessWidget {
  final DailyProjectStats dailyProjectStat;

  const HistoryListItem({Key? key, required this.dailyProjectStat}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomInkWellCard(
        onTap: () {},
        margin: EdgeInsets.only(bottom: 14.h),
        borderRadius: BorderRadius.circular(20.r),
        decoration: const BoxDecoration(boxShadow: [AppShadows.cardShadow]),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 72.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    dailyProjectStat.timeSpent.formattedPrint(),
                    style: TextStyle(fontSize: 20.sp),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    dailyProjectStat.date.toString(),
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
