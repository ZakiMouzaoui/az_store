import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController{
  static SettingsController get instance => Get.find();

  Rx<ThemeMode> themeMode = ThemeMode.system.obs;
  final _storage = GetStorage();

  @override
  void onInit() {
    final isDarkTheme = _storage.read<bool>("isDarkTheme");
    if(isDarkTheme != null){
      if(isDarkTheme){
        themeMode.value = ThemeMode.dark;
      }
      else{
        themeMode.value = ThemeMode.light;
      }
    }
    super.onInit();
  }

  void toggleAppTheme(){
    if(themeMode.value == ThemeMode.dark){
      themeMode.value = ThemeMode.light;
      _storage.write("isDarkTheme", false);
    }
    else{
      themeMode.value = ThemeMode.dark;
      _storage.write("isDarkTheme", true);
    }
  }
}