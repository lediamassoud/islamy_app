import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

import '../path_image.dart';
import 'hadeth.dart';

class HadethDetails extends StatelessWidget {
  static const routeName = "hadeth_details";
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as HadethData;

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
            title: Center(
              child: Text(
                "إسلامي",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
            decoration: BoxDecoration(color: AppThem.whiteColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  args.title,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                Divider(
                  color: AppThem.primaryLight,
                  thickness: 1,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: Text(
                    content(args.hadethContent),
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.titleMedium,
                  )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  String content(List<String> content) {
    String cont = "";
    for (int i = 0; i < content.length; i++) {
      cont += content[i];
    }
    print(cont);
    return cont;
  }
}
