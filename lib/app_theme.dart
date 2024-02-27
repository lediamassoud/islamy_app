
import 'package:flutter/material.dart';

class AppThem{
  //colors ,  light mode, dark mode, styling

  static Color whiteColor = const Color(0xffffffff);
  static Color blackColor = const Color(0xff242424);
  static Color primaryLight= const Color(0xffB7935F);
  static Color primaryDark = const Color(0xff141A2E);
  static Color yellow= const Color(0xffFACC1D);
  static const Color lightBlack = Color(0xff242424);
  static const Color transparent = Colors.transparent;
  static const Color kamony = Color(0xffc8b395);

  //lightMode
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
      unselectedItemColor: whiteColor
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

  //darkMode
  static ThemeData darkMode = ThemeData(
      primaryColor:yellow ,
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(
          color: whiteColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        //backgroundColor: primaryLight,
        selectedItemColor: yellow,
        unselectedItemColor: whiteColor

      ),
      textTheme:   TextTheme(
          titleLarge: TextStyle(
            color: yellow,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            color: yellow,
            fontWeight: FontWeight.w500,
            fontSize: 25,
          ),
          titleSmall: TextStyle(
            color: yellow,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )
      )

  );
}