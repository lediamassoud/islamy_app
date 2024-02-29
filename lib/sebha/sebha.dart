import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:provider/provider.dart';

import '../path_image.dart';
import '../provider/provider_theme.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Sebha extends StatefulWidget {
  static const routeName = "sebha";
  const Sebha({super.key});



  @override
  State<Sebha> createState() => _SebhaState();
}

class _SebhaState extends State<Sebha> {
  int counter = 0;
  String elzecr = "سبحان الله";

  double turns = 0.0;
  late ProviderTheme themeProvider;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Stack(
            children: [
               const Positioned(
                  top: 0,
                  left: 150,
                  child: Image(image: AssetImage(PathImages.headOfSebha))),
              Padding(
                padding: const EdgeInsets.all(75.0),
                child: AnimatedRotation(
                    turns: turns,
                    duration: const Duration(seconds: 1),
                    child:  const Image(image: AssetImage(PathImages.bodyOfSebha))),
              ),
            ],
          ),
        ),
         Text(
          AppLocalizations.of(context)!.tasbeh_numbers,
          style: TextStyle(
              color: themeProvider.isDark? AppThem.yellow : AppThem.lightBlack,
              backgroundColor: AppThem.transparent,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        Container(
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppThem.kamony,
          ),
          child: Text(
            "${counter}",
            style: const TextStyle(
                color: AppThem.lightBlack,
                backgroundColor: AppThem.kamony,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        InkWell(
          onTap: updateCounter,
          child: Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppThem.primaryLight,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              elzecr,
              style: TextStyle(
                fontSize: 25,
                color: AppThem.whiteColor,
              ),
            ),
          ),
        )
      ],
    );
  }

  void updateCounter() {
    counter++;
    turns += 1/8;
    if (counter >= 34) {
      if(elzecr == AppLocalizations.of(context)!.soubhan_allah){
        elzecr = AppLocalizations.of(context)!.alhmed_lallah;
      }else{
        elzecr = AppLocalizations.of(context)!.soubhan_allah;
      }
      counter = 0;
    }
    setState(() {});
  }
}
