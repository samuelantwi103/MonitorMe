import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:monitor_me/pages/user/home.dart';

import 'package:monitor_me/pages/user/onboarding/intro_1.dart';
import 'package:monitor_me/pages/user/onboarding/intro_2.dart';
import 'package:monitor_me/pages/user/onboarding/intro_3.dart';
import 'package:monitor_me/services/transitions.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return Scaffold(
      body: Stack(alignment: const Alignment(0, 0.75), children: [
        PageView(
          controller: pageController,
          onPageChanged: (value) {
            setState(() {
              onLastPage = value == 2;
            });
            // debugPrint(onLastPage.toString());
          },
          children: const [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Skip
            GestureDetector(
              onTap: () {
                pageController.jumpToPage(2);
              },
              child: Text(
                onLastPage ? "    " : "Skip",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(
                      // color: Theme.of(context).colorScheme.onPrimary
                    ),
              ),
            ),

            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotColor: Theme.of(context).colorScheme.onSecondary,
                activeDotColor: Theme.of(context).colorScheme.primary
              ),

            ),

            // Next
            GestureDetector(
                onTap: () {
                  onLastPage
                      // Go to Home Page
                      ? Navigator.pushReplacement(
                          context,
                          slideLeftTransition(const HomePage()),
                        )
                      // Switch to next page
                      : pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                },
                child: Text(
                  onLastPage ? "Done" : "Next",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      // color: Theme.of(context).colorScheme.onPrimary
                      ),
                )),
          ],
        )
      ]),
    );
  }
}
