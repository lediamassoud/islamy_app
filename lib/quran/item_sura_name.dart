import 'package:flutter/material.dart';
import 'package:islami_app/quran/sura-details.dart';

class ItemSuraName extends StatelessWidget {
  String name;
  int index;
   ItemSuraName({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed(SuraDetails.routeName,
        arguments: SuraNameArguments(name: name, index:index));
      },
      child: Text(name,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium,),
    );
  }
}


class SuraNameArguments{
  String name;
  int index;
  SuraNameArguments({required this.name, required this.index});
}
