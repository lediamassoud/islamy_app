import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/settings/language_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../provider/app_config_provider.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<AppConfigProvider>(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
              decoration: BoxDecoration(
                  color: AppThem.primaryLight,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(languageProvider.language == "en"? AppLocalizations.of(context)!.english : AppLocalizations.of(context)!.arabic),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }
}
