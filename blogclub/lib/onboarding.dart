import 'package:blogclub/auth.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'data.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  final PageController _pageController = PageController();
  final items = AppDatabase.onBoardingItems;

  int page = 0;
  @override
  void initState() {
    // TODO: implement initState
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 32),
                child: Assets.img.background.onboarding.image(fit: BoxFit.fill),
              ),
            ),
            Container(
              height: 260,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 20, color: Colors.black.withOpacity(0.1))
                  ],
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32))),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                        itemCount: items.length,
                        controller: _pageController,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  items[index].title,
                                  style: themeData.textTheme.headlineLarge,
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                Text(
                                  items[index].description,
                                  style: themeData.textTheme.titleSmall,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Container(
                    height: 60,
                    padding:
                        const EdgeInsets.only(left: 32, right: 32, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: items.length,
                          effect: ExpandingDotsEffect(
                              activeDotColor: themeData.primaryColor,
                              dotColor: themeData.colorScheme.primary
                                  .withOpacity(0.1),
                              dotHeight: 8,
                              dotWidth: 8),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            if (page == items.length - 1) {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AuthScreen()));
                            } else {
                              _pageController.animateToPage(page + 1,
                                  duration: const Duration(microseconds: 500),
                                  curve: Curves.decelerate);
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.blue),
                            minimumSize:
                                WidgetStateProperty.all(const Size(84, 60)),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                          child: Icon(
                            page == items.length - 1
                                ? CupertinoIcons.check_mark
                                : CupertinoIcons.arrow_right,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
