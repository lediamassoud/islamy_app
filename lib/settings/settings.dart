import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_theme.dart';
import 'package:islami_app/provider/provider_theme.dart';
import 'package:islami_app/settings/language_bottom_sheet.dart';
import 'package:islami_app/settings/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

import '../provider/provider_language.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<ProviderLanguage>(context);
    var themeProvider = Provider.of<ProviderTheme>(context);
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //language settings
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
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
                  Text(languageProvider.language == "en"
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 35,
                  )
                ],
              ),
            ),
          ),

          //theme settings
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),

          // Text(
          //   AppLocalizations.of(context)!.theme,
          //   style: Theme.of(context).textTheme.titleMedium,
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                themeProvider.isDark()
                    ? AppLocalizations.of(context)!.light
                    : AppLocalizations.of(context)!.dark,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Switch(
                  value: themeProvider.isDark(),
                  onChanged: (newValue) {
                    themeProvider.changeThemeMode(newValue);
                  },
                  activeTrackColor: themeProvider.isDark()
                      ? AppThem.primaryLight
                      : AppThem.blackColor,
                  activeColor: themeProvider.isDark()
                      ? AppThem.primaryLight
                      : AppThem.blackColor),
            ],
          )
        ],
      ),
    );
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }
}

/*
InkWell(
            onTap: () {
              showThemeBottomSheet();
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
          ),

* * */
