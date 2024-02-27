import 'package:flutter/material.dart';
import 'package:islami_app/provider/provider_theme.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash_screen";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderTheme themeProvider = Provider.of(context);
    Future.delayed(const Duration(seconds: 5),
        (){
      Navigator.pushReplacementNamed(context, Home.routeName);
        });
    return Scaffold(
      body: Image(
        image: AssetImage(themeProvider.getSplashImagePath),
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
