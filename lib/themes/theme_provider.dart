
import 'package:flutter/material.dart';
import 'package:music/themes/dark_mode.dart';
import 'package:music/themes/light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  //initially let make it light mode
  ThemeData _themeData = lightMode;
  
  // we create a get theme 
  ThemeData get themeData => _themeData;

  // we check for if the current theme is equal to the dark mode 
 
  bool get isDarkmode => _themeData == darkMode;
  
  //we create the set theme 
  set themeData(ThemeData themeData){
    _themeData = themeData;
    
    //we use it to update the UI
    notifyListeners();
  }
  //we toggle between the two themes 
  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }
    else{
      themeData = lightMode;
    }
  }

}