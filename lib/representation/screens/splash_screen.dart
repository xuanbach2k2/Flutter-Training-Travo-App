import 'package:flutter/material.dart';
import 'package:travoapp/core/helpers/asset_helper.dart';
import 'package:travoapp/core/helpers/image_helper.dart';
import 'package:travoapp/representation/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/splash_screen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    redirectIntroScreen();
  }

  void redirectIntroScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushNamed(IntroScreen.routeName);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
            AssetHelper.imageBackGroundSplash,
            fit: BoxFit.cover,
        ),
        ),
        Positioned.fill(
          child: ImageHelper.loadFromAsset(
          AssetHelper.imageCircle,
            fit: BoxFit.cover,
        ),
        )
      ],
    );
  }
}
