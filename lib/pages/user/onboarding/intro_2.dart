import 'package:flutter/material.dart';
import 'package:monitor_me/themes/theme_switch.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.blueAccent,
      body: SafeArea(child: ThemeSwitch()),
    );
  }
}