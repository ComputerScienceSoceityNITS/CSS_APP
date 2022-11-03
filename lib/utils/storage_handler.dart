import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHandler {
  static SharedPreferences? _preferences;
  StorageHandler() {
    if (_preferences == null) {
      _initPreferences();
    }
  }

  // ----------------------------- Getter Methods -----------------------------
  bool get isDarkTheme =>
      _preferences?.getBool('isDarkTheme') ??
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark;

  // ----------------------------- Setter Methods -----------------------------
  Future<void> setDarkTheme(bool isDarkTheme) async {
    await _preferences?.setBool('isDarkTheme-', isDarkTheme);
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
