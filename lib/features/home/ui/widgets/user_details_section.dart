import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/user_details.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class UserDetailsSection extends StatelessWidget {
  final UserDetails _userDetails;

  const UserDetailsSection({Key? key, required UserDetails userDetails})
      : _userDetails = userDetails,
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
            backgroundImage: NetworkImage(_userDetails.photoUrl),
            backgroundColor: AppColors.appBG,
          ),
        ),
        SizedBox(width: 36.w),
        Text(
          _userDetails.displayName,
          style: TextStyle(
            fontSize: 38.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
