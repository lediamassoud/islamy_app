import 'package:flutter/material.dart';
import 'package:islami_app/app_theme.dart';

import '../path_image.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.07),
      child: Column(
        children: [
          Image(image: AssetImage(PathImages.radioImage)
          ),
          Text(AppLocalizations.of(context)!.ezaha,
          style: Theme.of(context).textTheme.titleMedium,),
          
           Container(
          width: double.infinity,
             padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.08),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.skip_previous, color: AppThem.primaryLight,size: 45,),
                Icon(Icons.pause, color: AppThem.primaryLight,size: 50,),
                Icon(Icons.skip_next, color: AppThem.primaryLight, size: 45,)

              ],
          ),
           )
        ],
      ),
    );
  }
}

