
import 'package:flutter/material.dart';
import 'package:travoapp/representation/screens/intro_screen.dart';
import 'package:travoapp/representation/screens/main_app.dart';
import 'package:travoapp/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
};