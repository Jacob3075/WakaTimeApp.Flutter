import "dart:math";

import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:waka_time_app/common/ui/theme/app_assets.dart";

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loadingAnimations = AppAssets.animations.loadingAnimations;
    return Center(
      child: Lottie.asset(loadingAnimations[Random().nextInt(loadingAnimations.length)]),
    );
  }
}
