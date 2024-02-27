import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami_app/app_theme.dart';
import 'package:provider/provider.dart';

import '../provider/provider_theme.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var providerTheme = Provider.of<ProviderTheme>(context);
    return Container(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //design language theme
          InkWell(
            onTap: (){
              providerTheme.changeThemeMode(ThemeMode.light);
            },
            child: providerTheme.themeMode == ThemeMode.light?
            getSelectedItemWidget(AppLocalizations.of(context)!.light) :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.light),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          InkWell(
            onTap: (){
              providerTheme.changeThemeMode(ThemeMode.dark);
            },
            child: providerTheme.themeMode == ThemeMode.dark?
            getSelectedItemWidget(AppLocalizations.of(context)!.dark) :
            getUnSelectedItemWidget(AppLocalizations.of(context)!.dark),
          ),

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
              color: AppThem.primaryDark
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
