import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/home.dart';
import 'package:islami_app/quran/sura-details.dart';
import 'package:islami_app/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home(),
        SuraDetails.routeName: (_) =>  SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
      },
      initialRoute: Splash.routeName,

      theme: AppThem.lightMode,

      home: const Splash(),
    );
  }
}


