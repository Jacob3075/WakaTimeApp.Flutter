import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:lottie/lottie.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";

class Animations extends StatelessWidget {
  final String randomAnimation;
  final String? message;

  const Animations._({Key? key, required this.randomAnimation, this.message}) : super(key: key);

  factory Animations.loading() =>
      Animations._(randomAnimation: AppAssets.animations.randomLoadingAnimation);

  factory Animations.empty([String? message]) =>
      Animations._(randomAnimation: AppAssets.animations.randomOtherAnimation, message: message);

  factory Animations.error(String message) =>
      Animations._(randomAnimation: AppAssets.animations.randomErrorAnimation, message: message);

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(randomAnimation),
            if (message != null) ...[
              SizedBox(height: 10.h),
              Text(message!),
            ]
          ],
        ),
      );
}
