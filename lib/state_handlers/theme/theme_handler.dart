import 'package:cssapp/utils/storage_handler.dart';
import 'package:flutter/material.dart';

class ThemeHandler extends ChangeNotifier {
  ThemeHandler? _themeHandler;
  late ThemeMode _themeMode;

  ThemeHandler({ThemeHandler? themeHandler}) {
    _themeHandler = themeHandler;
    _themeMode =
    StorageHandler().isDarkTheme == true ? ThemeMode.dark : ThemeMode.light;
  }

  ThemeMode get themeMode => _themeHandler?.themeMode ?? _themeMode;

  Future<void> toggleTheme() async {
    if (_themeHandler == null) {
      _themeMode =
      _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
      StorageHandler().setDarkTheme( _themeMode == ThemeMode.dark);
    } else {
      _themeHandler!.toggleTheme();
    }
    notifyListeners();
  }
}