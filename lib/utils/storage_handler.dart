// ignore_for_file: avoid_print

import 'dart:ui';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHandler {
  static SharedPreferences? _preferences;

  // ----------------------------- Getter Methods -----------------------------
  bool isDarkTheme() {
    return _preferences?.getBool('isDarkTheme') ??
        PlatformDispatcher.instance.platformBrightness == Brightness.dark;
  }

  // ----------------------------- Setter Methods -----------------------------
  Future<void> toggleDarkTheme() async {
    await _preferences?.setBool('isDarkTheme', !isDarkTheme());
  }

  Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
