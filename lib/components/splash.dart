// ../../washking/washking/lib/components/splash.dart
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_me/pages/auth/auth_gate.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child:  Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            height: 0.3 * MediaQuery.sizeOf(context).height,
                            constraints: const BoxConstraints(minHeight: 150),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.monitor_heart,
                                  size: 0.2 * MediaQuery.sizeOf(context).height,
                                ),
                                Text(
                                  "MonitorMe",
                                  style: GoogleFonts.bebasNeue(fontSize: 30),
                                )
                              ],
                            )
                            //     Image.asset("assets/sonmit-transparent.png"),
                            ),
                        const SizedBox(height: 25),
            ],
          ),
        ),
      ),
      splashIconSize: 400,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      nextScreen: const AuthGate(),
    );
  }
}
