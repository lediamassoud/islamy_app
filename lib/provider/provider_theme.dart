import 'package:flutter/material.dart';
import 'package:islami_app/path_image.dart';

class ProviderTheme extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void changeThemeMode(ThemeMode newThemeMode){
    if(newThemeMode == themeMode){
      return;
    }
    themeMode = newThemeMode;

    notifyListeners();
  }
//return true if mode is dark and false if mode is light
   bool isDark(){
    bool mode = true;
    if(themeMode == ThemeMode.light){
      mode = false;
    }
    return mode;
  }
  String get getSplashImagePath{
    if(isDark()){
      return PathImages.darkSplashImage;
    }else{
      return PathImages.splashImage;
    }
  }

  String get getBackgroundImagePath{
    if(isDark()){
      return PathImages.bgImageDark;
    }else{
      return PathImages.bgImage;
    }
  }
}
