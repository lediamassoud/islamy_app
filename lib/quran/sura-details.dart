import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/quran/item_sura_name.dart';

import '../path_image.dart';
import 'item_sura_details.dart';

class SuraDetails extends StatefulWidget {
  static const routeName = "sura_details";
  SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraNameArguments;
    if (verses.isEmpty) {
      readFile(args.index);
    }

    return Stack(
      children: [
        const Image(
          image: AssetImage(PathImages.bgImage),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Text(
              "${args.name}",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(
                  color: AppThem.primaryLight,
                ))
              : Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.06,
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  decoration: BoxDecoration(
                    color: AppThem.whiteColor,
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) =>
                        ItemSuraDetails(name:verses[index], index: index),
                    itemCount: verses.length,
                  ),
                ),
        )
      ],
    );
  }

  void readFile(int index) async {
    String content =
        await rootBundle.loadString("assets/files/${index + 1}.txt");
    List<String> lines = content.split("\n");

    setState(() {
      verses = lines;
    });
  }
}
