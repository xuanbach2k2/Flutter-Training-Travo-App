import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travoapp/core/constants/color_constants.dart';
import 'package:travoapp/core/constants/dismension_constants.dart';
import 'package:travoapp/core/constants/string_constants.dart';
import 'package:travoapp/core/constants/textstyle_constants.dart';
import 'package:travoapp/core/helpers/asset_helper.dart';
import 'package:travoapp/core/helpers/image_helper.dart';
import 'package:travoapp/representation/screens/main_app.dart';
import 'package:travoapp/representation/widgets/button_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = 'intro_screen';
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  final PageController _pageController = PageController();

  final StreamController<int> _pageStreamController = StreamController<int>.broadcast();
  @override
  void initState() {
      super.initState();
      _pageController.addListener(() {
          print(_pageController.page);
          _pageStreamController.add(_pageController.page!.toInt());
      });
  }

  Widget _buildItemIntroScreen(String image, String title, String description, AlignmentGeometry alignment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomRight,
          child: ImageHelper.loadFromAsset(
              image,
              height: 450,
              fit: BoxFit.fitHeight
          ),
        ),
        const SizedBox(height: kMediumPadding * 2,
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: kMediumPadding
        ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              )),
              SizedBox(
                height: kMediumPadding,
              ),
              Text(description, style: TextStyles.defaultStyle,)
            ],
          ),
        ),
      ],
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildItemIntroScreen(AssetHelper.intro1, title_intro1, description_intro1,Alignment.centerRight),
              _buildItemIntroScreen(AssetHelper.intro2, title_intro2, description_intro2,Alignment.center),
              _buildItemIntroScreen(AssetHelper.intro3, title_intro3, description_intro3,Alignment.centerLeft),
            ],
          ),
          Positioned(
              left: kMediumPadding,
              right: kMediumPadding,
              bottom: kMediumPadding * 2,
              child: Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count:  3,
                      axisDirection: Axis.horizontal,
                      effect: const ExpandingDotsEffect(
                          dotHeight: kMinPadding,
                          dotWidth: kMinPadding,
                          activeDotColor:  ColorPalette.yellowColor
                      ),
                    ),
                  ),
                  StreamBuilder<int>(
                    initialData: 0,
                    stream: _pageStreamController.stream,
                    builder: (context, snapshot) {
                      return Expanded(
                          flex: 3,
                          child:
                          ButtonWidget(
                            title: snapshot.data != 2 ? "Next" : "Get started",
                            ontap: () {
                              if(_pageController.page != 2) {
                                _pageController.nextPage(duration: Duration(microseconds: 200), curve: Curves.easeIn);
                              } else {
                                Navigator.of(context).pushNamed(MainApp.routeName);
                              }

                            },
                          ));

                    }
                  )
                ],
              ),),

        ],
      ),
    );
  }
}
