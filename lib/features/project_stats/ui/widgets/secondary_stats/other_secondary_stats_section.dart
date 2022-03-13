import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/secondary_stats/other_secondary_stats_list_item.dart";

class OtherSecondaryStatsSection {
  final SecondaryStats secondaryStats;
  late final int numberOfItems;

  OtherSecondaryStatsSection({Key? key, required this.secondaryStats}) {
    numberOfItems = secondaryStats.values.length == 1 ? 2 : secondaryStats.values.length;
  }

  Widget sectionHeader() => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Other ${secondaryStats.statsType}",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 14.h),
          ],
        ),
      );

  Widget listItem(int index) => secondaryStats.values.length == 1
      ? _noOtherItems()
      : Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: OtherSecondaryStatListItem(
            secondaryStat: secondaryStats.values[index],
          ),
        );

  Widget _noOtherItems() => SvgPicture.asset(
        AppAssets.illustrations.randomEmptyIllustration,
        height: 250.h,
      );
}
