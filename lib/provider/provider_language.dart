import 'package:flutter/material.dart';

class ProviderLanguage extends ChangeNotifier {
  String language = "ar";

  void changeTheLanguage(String newLanguage){
    if(newLanguage == language){
      return;
    }
    language = newLanguage;

    notifyListeners();
  }


}
