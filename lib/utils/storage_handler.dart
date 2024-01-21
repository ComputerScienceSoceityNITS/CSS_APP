// ignore_for_file: avoid_print

import 'dart:ui';
import 'package:cssapp/state_handlers/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHandler {
  static SharedPreferences? _preferences;

  // ----------------------------- Getter Methods -----------------------------
  bool isDarkTheme() {
    return _preferences?.getBool('isDarkTheme') ??
        PlatformDispatcher.instance.platformBrightness == Brightness.dark;
  }

  Future<UserModel?> loadUserFromLocalStorage() async {
    final jsonString = _preferences?.getString('user');
    if (jsonString != null) {
      return UserModel.fromJson(jsonString);
    } else {
      return null;
    }
  }

  // ----------------------------- Setter Methods -----------------------------
  Future<void> toggleDarkTheme() async {
    await _preferences?.setBool('isDarkTheme', !isDarkTheme());
  }

  Future<void> saveUserToLocalStorage(UserModel user) async {
    await _preferences?.setString('user', user.toJson());
  }

  Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
