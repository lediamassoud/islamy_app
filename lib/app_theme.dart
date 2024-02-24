
import 'package:flutter/material.dart';

class AppThem{
  //colors ,  light mode, dark mode, styling

  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff242424);
  static Color primaryLight= const Color(0xffB7935F);

  static ThemeData lightMode = ThemeData(
    primaryColor:primaryLight ,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: blackColor,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //backgroundColor: primaryLight,
      selectedItemColor: blackColor,
    ),
    textTheme:  const TextTheme(
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 25,
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 20,
      )
    )

  );
}