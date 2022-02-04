import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/common_models.dart";
import "package:waka_time_app/common/domain/models/time.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";
import "package:waka_time_app/common/ui/theme/app_colors.dart";
import "package:waka_time_app/common/ui/widgets/stats_card.dart";

class MostUsedLanguageCard extends StatelessWidget {
  final List<Language> languages;
  late final Language? mostUsedLanguage;

  MostUsedLanguageCard({Key? key, required this.languages}) : super(key: key) {
    mostUsedLanguage =
        languages.sorted((it1, it2) => it1.timeSpent.compareTo(it2.timeSpent)).reversed.firstOrNull;
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: StatsCard(
          gradient: AppGradients.greenCyan,
          text: "Most Time\nSpent On",
          valueWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _mostUsedLanguageTime(),
                style: StatsCard.valueTextStyle,
              ),
              Text(
                mostUsedLanguage?.name ?? "",
                style: TextStyle(fontSize: 16.sp),
              )
            ],
          ),
          icon: AppAssets.icons.codeFile,
          cardHeight: 65.h,
          borderRadius: BorderRadius.circular(16.r),
        ),
      );

  String _mostUsedLanguageTime() => mostUsedLanguage != null
      ? languages
          .where((element) => element.name == mostUsedLanguage!.name)
          .map((it) => it.timeSpent)
          .fold(
            Time.zero,
            (Time previousValue, Time element) => previousValue + element,
          )
          .formattedPrint()
      : Time.zero.formattedPrint();
}
