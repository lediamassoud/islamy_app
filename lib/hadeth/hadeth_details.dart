import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';
import 'package:provider/provider.dart';

import '../path_image.dart';
import '../provider/provider_theme.dart';
import 'hadeth.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethDetails extends StatelessWidget {
  static const routeName = "hadeth_details";
  const HadethDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderTheme themeProvider = Provider.of(context);

    var args = ModalRoute.of(context)!.settings.arguments as HadethData;

    return Stack(
      children: [
         Image(
          image: AssetImage(themeProvider.getBackgroundImagePath),
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                AppLocalizations.of(context)!.app_title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
            decoration: BoxDecoration(
                color: themeProvider.isDark()?AppThem.primaryDark:AppThem.whiteColor
            ),
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

    return cont;
  }
}
