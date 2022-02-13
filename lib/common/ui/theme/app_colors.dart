import "package:flutter/material.dart";

abstract class AppColors {
  static const appBG = Color(0xFF121212);
  static const cardBGPrimary = Color(0xFF272727);
  static const cardBGSecondary = Color(0xFF2E2E2E);
  static const accentIcons = Color(0xFF6FEBFF);
  static const accentText = Color(0xFF8CE3E3);
}

class Gradient {
  const Gradient(this.startColor, this.endColor, [this.opacity = 100]);

  final Color startColor;
  final Color endColor;
  final int opacity;
}

abstract class AppGradients {
  static const primary = Gradient(Color(0xFF3F67E0), Color(0xFF65D1E2));
  static const secondary = Gradient(Color(0xFF3F55E0), Color(0xFF5EC2D2), 85);
  static const purpleCyanLight = Gradient(Color(0xFFCC1FBB), Color(0xFF6FEBFF));
  static const purpleCyanDark = Gradient(Color(0xFF921FC9), Color(0xFF5EC2D2));
  static const greenCyan = Gradient(Color(0xFF18A963), Color(0xFF65D0E1));
  static const blueCyan = Gradient(Color(0xFF7B61FF), Color(0xFF63CFE1));
  static const redPurple = Gradient(Color(0xFFEB4F4F), Color(0xFFDC52B5));
  static const orangeYellow = Gradient(Color(0xFFFF9900), Color(0xFFE8C754));
}

abstract class AppShadows {
  static const cardShadow = BoxShadow(
    color: Colors.black,
    blurRadius: 12,
    offset: Offset(0, 4),
    spreadRadius: 1,
  );

  static const chartShadow = BoxShadow(
    color: Colors.black,
    blurRadius: 10,
    offset: Offset(0, 4),
    spreadRadius: 5,
  );
}
