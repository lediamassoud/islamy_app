import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/hadeth/hadeth.dart';
import 'package:islami_app/path_image.dart';
import 'package:islami_app/provider/provider_theme.dart';
import 'package:islami_app/quran/quran.dart';
import 'package:islami_app/sebha/sebha.dart';
import 'package:islami_app/radio/radio.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:islami_app/settings/settings.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const String routeName = "home_screen";

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    ProviderTheme themeProvider = Provider.of(context);
    return Stack(children: [
       Image(
        image: AssetImage(themeProvider.getBackgroundImagePath),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: themeProvider.isDark()?AppThem.primaryDark:AppThem.primaryLight,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              print(selectedIndex);
              setState(() {});
            },
            items:  [
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: AppLocalizations.of(context)!.settings),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(PathImages.radioIcon)), label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(PathImages.sebhaIcon)), label: AppLocalizations.of(context)!.sebha),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(PathImages.hadethIcon)),
                  label: AppLocalizations.of(context)!.hadeth),
              BottomNavigationBarItem(
                  icon: const ImageIcon(AssetImage(PathImages.quranIcon)), 
                  label: AppLocalizations.of(context)!.quran),

            ],
          ),
        ),
      )
    ]);
  }

  List<Widget> tabs = [Settings(), RadioTab(), Sebha(), Hadeth(), Quran()];
}
