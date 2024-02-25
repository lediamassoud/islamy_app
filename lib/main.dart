import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';
import 'package:islami_app/home.dart';
import 'package:islami_app/provider/app_config_provider.dart';
import 'package:islami_app/quran/sura-details.dart';
import 'package:islami_app/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(context) => AppConfigProvider(),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.routeName: (_) => const Splash(),
        Home.routeName: (_) => const Home(),
        SuraDetails.routeName: (_) => SuraDetails(),
        HadethDetails.routeName: (_) => HadethDetails(),
      },
      initialRoute: Splash.routeName,
      theme: AppThem.lightMode,
      locale: Locale(languageProvider.language),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Splash(),
    );
  }
}
