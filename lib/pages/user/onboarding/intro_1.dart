import 'package:flutter/material.dart';
import 'package:monitor_me/themes/theme_switch.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      body: const SafeArea(
        child: ThemeSwitch(),
      ),
    );
  }
}
