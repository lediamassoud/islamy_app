import 'package:flutter/material.dart';
import 'package:islami_app/path_image.dart';
import 'package:shared_preferences/shared_preferences.dart';

  class ProviderTheme extends ChangeNotifier {

  SharedPreferences? sharedPreferences;
  static const String shPrKey = "isDark";

  ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode(bool switchValue){
    themeMode = switchValue? ThemeMode.dark : ThemeMode.light;
    saveTheme(isDark);

    notifyListeners();
  }

//return true if mode is dark and false if mode is light
   bool get isDark{
    bool mode = true;
    if(themeMode == ThemeMode.light){
      mode = false;
    }
    return mode;
  }

  String get getSplashImagePath{
    if(isDark){
      return PathImages.darkSplashImage;
    }else{
      return PathImages.splashImage;
    }
  }

  String get getBackgroundImagePath{
    if(isDark){
      return PathImages.bgImageDark;
    }else{
      return PathImages.bgImage;
    }
  }
//Shared sharedPreferences functions
  Future<void> setItems()async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(getTheme() ?? false){
      changeThemeMode(getTheme()!);
    }
  }

  Future<void> saveTheme (bool isDarkParameter)async {
    await sharedPreferences!.setBool(shPrKey, isDarkParameter);
  }

  bool? getTheme(){
    return sharedPreferences!.getBool(shPrKey);
  }
}
