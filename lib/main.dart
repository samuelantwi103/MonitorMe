import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:monitor_me/components/splash.dart';
import 'package:monitor_me/themes/theme.dart';
import 'package:monitor_me/themes/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeMode themeMode = Provider.of<ThemeNotifier>(context).themeData;
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      home: const SplashScreen(),
    );
  }
}
