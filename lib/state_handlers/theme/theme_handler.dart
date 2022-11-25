import 'package:cssapp/utils/storage_handler.dart';
import 'package:flutter/material.dart';

class ThemeHandler extends ChangeNotifier {
  ThemeHandler? _themeHandler;
  late ThemeMode _themeMode;
  int i = 0;

  ThemeHandler({ThemeHandler? themeHandler}) {
    _themeHandler = themeHandler;
  }
  Future<void> init() async {
    _themeMode = (await StorageHandler().isDarkTheme == true)
        ? ThemeMode.dark
        : ThemeMode.light;
    notifyListeners();
  }

  ThemeMode get themeMode => _themeHandler?.themeMode ?? _themeMode;

  Future<void> toggleTheme() async {
    if (_themeHandler == null) {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      await StorageHandler().setDarkTheme(_themeMode == ThemeMode.dark);
    } else {
      _themeHandler!.toggleTheme();
    }

    notifyListeners();
  }
}
