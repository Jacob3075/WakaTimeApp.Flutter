import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/features/project_stats/ui/widgets/language_stats/other_languages_list_item.dart";

class OtherLanguagesSection extends StatelessWidget {
  final Languages languages;

  const OtherLanguagesSection({Key? key, required this.languages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: _otherLanguagesList(),
          )
        ],
      ),
    );
  }

  Widget _otherLanguagesList() => ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: languages.values.length - 1,
        itemBuilder: (context, index) => OtherLanguagesListItem(
          language: languages.values[index + 1],
        ),
      );
}
