import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/ui/theme/colors.dart";
import "package:waka_time_app/features/home/ui/bloc/home_page_cubit.dart";

class UserDetailsSection extends StatelessWidget {
  final HomePageCubit _cubit;

  const UserDetailsSection({Key? key, required HomePageCubit cubit})
      : _cubit = cubit,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 34.r,
          backgroundColor: AppColors.cardBGPrimary,
          child: CircleAvatar(
            radius: 33.r,
            backgroundImage: NetworkImage(_cubit.userDetails.photoUrl),
            backgroundColor: AppColors.appBG,
          ),
        ),
        SizedBox(width: 36.w),
        Text(
          _cubit.userDetails.displayName,
          style: TextStyle(
            fontSize: 38.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
