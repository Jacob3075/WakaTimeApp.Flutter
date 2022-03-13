import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";

class Animations extends StatelessWidget {
  final String randomAnimation;

  const Animations._({Key? key, required this.randomAnimation}) : super(key: key);

  factory Animations.loading() =>
      Animations._(randomAnimation: AppAssets.animations.randomLoadingAnimation);

  factory Animations.empty() =>
      Animations._(randomAnimation: AppAssets.animations.randomOtherAnimation);

  factory Animations.error() =>
      Animations._(randomAnimation: AppAssets.animations.randomErrorAnimation);

  @override
  Widget build(BuildContext context) => Center(
        child: Lottie.asset(randomAnimation),
      );
}
