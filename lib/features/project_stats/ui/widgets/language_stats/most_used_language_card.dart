import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/stats_card.dart";

class MostUsedLanguageCard extends StatelessWidget {
  final List<Language> languages;
  late final Language mostUsedLanguage;

  MostUsedLanguageCard({Key? key, required this.languages}) : super(key: key) {
    mostUsedLanguage = LanguageStats.mostUsedLanguageFrom(languages).getOrElse(() => Language.none);
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: StatsCard.valueAsWidget(
          gradient: AppGradients.greenCyan,
          text: "Most Time\nSpent On",
          valueWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                mostUsedLanguage.timeSpent.formattedPrint(),
                style: StatsCard.valueTextStyle,
              ),
              Text(
                mostUsedLanguage.name,
                style: TextStyle(fontSize: 16.sp),
              )
            ],
          ),
          icon: AppAssets.icons.codeFile,
          cardHeight: 65.h,
          borderRadius: BorderRadius.circular(16.r),
        ),
      );
}
