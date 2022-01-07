import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";

class TimeSpentTodayCard extends StatelessWidget {
  final HomePageCubit _cubit;

  const TimeSpentTodayCard({Key? key, required HomePageCubit cubit})
      : _cubit = cubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 72.h,
      margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [AppGradients.primary.startColor, AppGradients.primary.endColor],
        ),
        boxShadow: const [AppShadows.cardShadow],
      ),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Time Spent\nToday",
                  style: TextStyle(fontSize: 16.sp),
                ),
                const Text("42H, 14M, +16%"),
              ],
            ),
          ),
          Positioned(
            child: SvgPicture.asset(
              AppAssets.icons.time,
              height: 72.h,
              width: 72.h,
            ),
            left: 100.h,
          ),
        ],
      ),
    );
  }
}
