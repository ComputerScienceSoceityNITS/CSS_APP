import 'package:flutter/material.dart';
import 'package:cssapp/configs/configs.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: Pallet.darkPrimaryColor,
  scaffoldBackgroundColor: Pallet.darkPrimaryColor,
  fontFamily: 'Archivo',
  canvasColor: Pallet.darkPrimaryColor,
  colorScheme: ColorScheme.fromSwatch(
    backgroundColor: Pallet.darkCardBGColor,
    primarySwatch: Pallet.primarySwatch,
    brightness: Brightness.dark,
  ).copyWith(secondary: Pallet.darkSecondaryColor),
  textTheme: const TextTheme().apply(
      bodyColor: Pallet.darkSecondaryColor,
      displayColor: Pallet.darkSecondaryColor),
  focusColor: Pallet.darkSecondaryColor,
);
