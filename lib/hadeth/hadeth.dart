import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/hadeth/hadeth_details.dart';

import '../app_theme.dart';
import '../path_image.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Hadeth extends StatefulWidget {
  Hadeth({super.key});

  @override
  State<Hadeth> createState() => _HadethState();
}

class _HadethState extends State<Hadeth> {
  List<HadethData> allHadethList = [];

  @override
  Widget build(BuildContext context) {
    if (allHadethList.isEmpty) {
      loadFile();
    }
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(PathImages.hadethImage),
          ),
          Divider(
            color: AppThem.primaryLight,
            thickness: 3,
          ),
          Text(
            AppLocalizations.of(context)!.hadeth_name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Divider(
            color: AppThem.primaryLight,
            thickness: 3,
          ),
          allHadethList.isEmpty
              ? CircularProgressIndicator(
                  color: AppThem.primaryLight,
                )
              : Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Center(
                            child: InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, HadethDetails.routeName,
                                arguments: HadethData(title: allHadethList[index].title, hadethContent: allHadethList[index].hadethContent));
                              },
                              child: Text(
                          allHadethList[index].title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: AppThem.primaryLight,
                          thickness: 1,
                        );
                      },
                      itemCount: allHadethList.length))
        ],
      ),
    );
  }

  void loadFile() async {
    String content = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> hadethList = content.split("#\r\n");

    for (int i = 0; i < hadethList.length; i++) {
      List<String> hadeth = hadethList[i].split("\n");
      String title = hadeth[0];
      hadeth.removeAt(0);

      allHadethList.add(HadethData(title: title, hadethContent: hadeth));

      setState(() {});
    }
  }
}

class HadethData {
  String title;
  List<String> hadethContent;

  HadethData({required this.title, required this.hadethContent});
}
