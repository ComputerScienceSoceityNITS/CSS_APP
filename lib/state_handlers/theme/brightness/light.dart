import 'package:flutter/material.dart';
import 'package:cssapp/configs/configurations/pallet.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: Pallet.lightSecondaryColor,
  scaffoldBackgroundColor: Pallet.lightPrimaryColor,
  fontFamily: 'Archivo',
  canvasColor: Pallet.lightPrimaryColor,
  textTheme: const TextTheme().apply(
    bodyColor: Pallet.lightSecondaryColor,
    displayColor: Pallet.lightSecondaryColor,
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Pallet.primarySwatch,
    brightness: Brightness.light,
  ).copyWith(secondary: Pallet.lightSecondaryColor),
);
