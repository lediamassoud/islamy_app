import 'package:flutter/material.dart';

class ItemSuraDetails extends StatelessWidget {
  String name;
  int index;
   ItemSuraDetails({super.key, required this.name, required this.index});

  @override
  Widget build(BuildContext context) {
    return Text("$name {${index+1}}",
      style: Theme.of(context).textTheme.titleSmall,
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
    );
  }
}
