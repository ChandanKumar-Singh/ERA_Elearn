import 'package:era_elearn/onboarding/pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static const String idScreen = 'onBoarding';

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final List _pages = [
    [
      '1.png',
      'Live Online Courses',
      'For the images, I used some Yoga vectors I found online. I made a few modifications to the colors using a graphics app. The rest is all code.'
    ],
    [
      '2.png',
      'Learning Online From Your Home',
      'For the images, I used some Yoga vectors I found online. I made a few modifications to the colors using a graphics app. The rest is all code.'
    ],
    [
      '3.png',
      'Get certified for online courses',
      'For the images, I used some Yoga vectors I found online. I made a few modifications to the colors using a graphics app. The rest is all code.'
    ],
    [
      '4.png',
      'Welcome to ERA-elern',
      'For the images, I used some Yoga vectors I found online. I made a few modifications to the colors using a graphics app. The rest is all code.'
    ],
  ];
  int? x;
  final PageController controller = PageController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF7C67C7),
      body: SafeArea(
          child: PageView.builder(
              onPageChanged: (int) => setState(() {
                    x = int;
                  }),
              controller: controller,
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return Pages(
                  controller: controller,
                    index: index,
                    image: _pages[index][0],
                    title: _pages[index][1],
                    content: _pages[index][2]);
              })),
    );
  }
}
// D:\Complete Projects\6-months-Projects\elearn\assets\flutter_assets\assets\images\onboard\1.png
