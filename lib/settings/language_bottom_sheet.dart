import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_theme.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  const LanguageBottomSheet({super.key});

  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //design language theme
          InkWell(
            onTap: (){
              languageProvider.changeTheLanguage("en");
            },
            child: languageProvider.language == "en"? 
            getSelectedItemWidget(AppLocalizations.of(context)!.english) :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.english),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
            onTap: (){
              languageProvider.changeTheLanguage("ar");
            },
            child: languageProvider.language == "ar"?
            getSelectedItemWidget(AppLocalizations.of(context)!.arabic) :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.arabic),
          ),

          //design dark and light mode

        ],
      ),
    );
  }

  Widget getSelectedItemWidget(String text){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppThem.primaryLight
          ) ,
        ),
        const Icon(
          Icons.check,
          size: 35,
        )
      ],
    );
  }

  Widget getUnSelectedItemWidget(String text){
    return Text(
      text,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
