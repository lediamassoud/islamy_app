import 'package:flutter/material.dart';

import 'home.dart';

class Splash extends StatelessWidget {
  static const String routeName = "splash_screen";
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5),
        (){
      Navigator.pushReplacementNamed(context, Home.routeName);
        });
    return const Scaffold(
      body: Image(
        image: AssetImage("assets/images/splash_light.png"),
        fit: BoxFit.fill,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
