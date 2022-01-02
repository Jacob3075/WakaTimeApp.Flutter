import "package:flutter/material.dart";

import "colors.dart";

abstract class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        primaryColor: Colors.blue,
        scaffoldBackgroundColor: AppColors.appBG,
        // https://stackoverflow.com/a/62424128/13181948
        textTheme: const TextTheme(
          bodyText1: TextStyle(),
          bodyText2: TextStyle(),
        ).apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
      );
}
