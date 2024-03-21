import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_c10_thursday/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = 'Splash-Screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
              color: Colors.white,
              child: Image.asset(
                'assets/images/background_pattern.png',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              )),
          Image.asset('assets/images/logo.png'),
        ],
      ),
    );
  }
}
