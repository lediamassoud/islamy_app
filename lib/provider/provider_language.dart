import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderLanguage extends ChangeNotifier {
  SharedPreferences? sharedPreferences;
  static const shPrKey = "isArabic";

  String language = "ar";

  void changeTheLanguage(String newLanguage){
    saveTheme(newLanguage);
    if(newLanguage == language){
      return;
    }
    language = newLanguage;

    notifyListeners();
  }

  //Shared sharedPreferences functions
  Future<void> setItems()async{
    sharedPreferences = await SharedPreferences.getInstance();
    if(getLanguage() == "en"){
      changeTheLanguage("en");
    }
    else{
      changeTheLanguage("ar");
    }
  }

  Future<void> saveTheme (String languageParameter)async {
    await sharedPreferences!.setString(shPrKey, languageParameter);
  }

  String? getLanguage(){
    return sharedPreferences!.getString(shPrKey);
  }

}
