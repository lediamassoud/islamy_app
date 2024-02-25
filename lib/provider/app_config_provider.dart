import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String language = "ar";

  void changeTheLanguage(String newLanguage){
    if(newLanguage == language){
      return;
    }
    language = newLanguage;

    notifyListeners();
  }
}
