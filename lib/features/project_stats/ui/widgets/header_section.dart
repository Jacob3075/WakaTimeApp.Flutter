import "dart:math";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";

class HeaderSection extends StatelessWidget {
  final String projectName;
  final Function() onClick;

  const HeaderSection({
    Key? key,
    required this.projectName,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onClick,
              child: Transform.rotate(
                angle: pi,
                child: SvgPicture.asset(
                  AppAssets.icons.arrow,
                  color: Colors.white,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),
            SizedBox(width: 18.w),
            Text(
              projectName,
              style: TextStyle(
                fontSize: 34.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
}
