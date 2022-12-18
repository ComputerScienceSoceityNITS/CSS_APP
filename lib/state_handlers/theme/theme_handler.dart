import 'package:cssapp/utils/storage_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeHandler extends ChangeNotifier {
  ThemeHandler? _themeHandler;
  late ThemeMode _themeMode;

  ThemeHandler({ThemeHandler? themeHandler}) {
    _themeHandler = themeHandler;
    _themeMode =
        StorageHandler().isDarkTheme() ? ThemeMode.dark : ThemeMode.light;
    setSystemNavColor();
  }

  ThemeMode get themeMode => _themeHandler?.themeMode ?? _themeMode;

  void setSystemNavColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor:
            _themeMode == ThemeMode.light ? Colors.white : Colors.black));
  }

  Future<void> toggleTheme() async {
    notifyListeners();

    if (_themeHandler == null) {
      _themeMode =
          !StorageHandler().isDarkTheme() ? ThemeMode.light : ThemeMode.dark;
      setSystemNavColor();
    } else {
      _themeHandler!.toggleTheme();
    }
  }
}
