import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/hadeth/hadeth.dart';
import 'package:islami_app/path_image.dart';
import 'package:islami_app/quran/quran.dart';
import 'package:islami_app/sebha/sebha.dart';
import 'package:islami_app/radio/radio.dart';

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
    return Stack(children: [
      const Image(
        image: AssetImage(PathImages.bgImage),
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
      Scaffold(
        appBar: AppBar(
          title: Text(
            "إسلامي",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: tabs[selectedIndex],
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: AppThem.primaryLight,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              selectedIndex = index;
              print(selectedIndex);
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(PathImages.radioIcon)), label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(PathImages.sebhaIcon)), label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(PathImages.hadethIcon)),
                  label: ""),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage(PathImages.quranIcon)), label: ""),
            ],
          ),
        ),
      )
    ]);
  }

  List<Widget> tabs = [RadioTab(), Sebha(), Hadeth(), Quran()];
}
