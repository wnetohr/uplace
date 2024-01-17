import "package:flutter/material.dart";
import "package:uplace/widgtes/themes/colors.dart";

final ThemeData uPlaceTheme = ThemeData(
  fontFamily: 'clarissans',
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueUplace),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.blueUplace,
  ),
  useMaterial3: true,
  scaffoldBackgroundColor: Colors.white,
);
