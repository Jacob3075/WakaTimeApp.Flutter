import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";

class CustomAppBar extends AppBar {
  final Function() onPressed;

  CustomAppBar({
    Key? key,
    projectName,
    required this.onPressed,
  }) : super(
          key: key,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            projectName,
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          titleSpacing: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              size: 28.sp,
              color: AppColors.accentIcons,
            ),
            onPressed: onPressed,
          ),
          bottom: const TabBar(
            indicatorColor: AppColors.accentIcons,
            isScrollable: true,
            tabs: [
              Tab(text: "Time"),
              Tab(text: "Language"),
              Tab(text: "OS"),
              Tab(text: "Editor"),
              Tab(text: "Other"),
            ],
          ),
        );
}
