import 'package:flutter/material.dart';
import 'package:travoapp/core/constants/color_constants.dart';
import 'package:travoapp/home_page.dart';
import 'package:travoapp/representation/screens/splash_screen.dart';
import 'package:travoapp/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor
      ),
      routes: routes,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
