import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/language_stats/other_languages_list_item.dart";

class OtherLanguagesSection {
  final Languages languages;

  const OtherLanguagesSection({Key? key, required this.languages});

  static Widget sectionHeader() => SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Other Languages",
              style: TextStyle(
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 14.h),
          ],
        ),
      );

  Widget listItem(int index) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: OtherLanguagesListItem(
          language: languages.values[index],
        ),
      );
}
