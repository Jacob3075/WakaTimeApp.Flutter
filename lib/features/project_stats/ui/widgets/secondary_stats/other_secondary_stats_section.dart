import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/secondary_stat.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/secondary_stats/other_secondary_stats_list_item.dart";

class OtherSecondaryStatsSection {
  final SecondaryStats secondaryStats;

  const OtherSecondaryStatsSection({Key? key, required this.secondaryStats});

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

  Widget listItem(int index) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: OtherSecondaryStatListItem(
          secondaryStat: secondaryStats.values[index],
        ),
      );
}
