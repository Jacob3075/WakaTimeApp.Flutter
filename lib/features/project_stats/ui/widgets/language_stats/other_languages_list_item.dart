import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:waka_time_app/common/domain/models/language.dart";
import "package:waka_time_app/common/ui/widgets/custom_ink_well_card.dart";

class OtherLanguagesListItem extends StatelessWidget {
  final Language language;

  const OtherLanguagesListItem({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) => CustomInkWellCard(
        onTap: () {},
        margin: EdgeInsets.only(bottom: 14.h),
        borderRadius: BorderRadius.circular(15.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                language.name,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    language.timeSpent.formattedPrint(),
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${language.percent}%",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w200,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
}
