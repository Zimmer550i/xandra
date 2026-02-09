import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_constants.dart';

class ThemeController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  final RxBool _darkTheme = RxBool(true);

  bool get darkTheme => _darkTheme.value;

  void toggleTheme() {
    _darkTheme.value = !_darkTheme.value;
    Get.changeThemeMode(_darkTheme.value ? ThemeMode.dark : ThemeMode.light);
    sharedPreferences.setBool(AppConstants.THEME, _darkTheme.value);
    update();
  }

  void changeTheme(Color lightColor, Color darkColor) {
    update();
  }

  void _loadCurrentTheme() async {
    _darkTheme.value = sharedPreferences.getBool(AppConstants.THEME) ?? false;
    update();
  }
}
