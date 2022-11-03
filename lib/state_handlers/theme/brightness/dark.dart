import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: Palette.darkPrimaryColor,
  scaffoldBackgroundColor: Palette.darkPrimaryColor,
  fontFamily: 'Archivo',
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Palette.darkPrimarySwatch,
    brightness: Brightness.dark,
  ).copyWith(secondary: Palette.darkSecondaryColor),
  textTheme: const TextTheme().apply(
      bodyColor: Palette.darkSecondaryColor,
      displayColor: Palette.darkSecondaryColor),
  focusColor: Palette.darkSecondaryColor,
);
