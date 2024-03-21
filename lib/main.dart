import 'package:flutter/material.dart';
import 'package:news_app_c10_thursday/ui/home/home_screen.dart';
import 'package:news_app_c10_thursday/ui/splash/splash_screen.dart';

void main() {
  runApp(MyApplication());
}

class MyApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        SplashScreen.routeName: (context) => SplashScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
