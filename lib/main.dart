import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monitor_me/backend/classes.dart';
import 'package:monitor_me/firebase_options.dart';
import 'package:provider/provider.dart';

import 'package:monitor_me/components/splash.dart';
import 'package:monitor_me/themes/theme.dart';
import 'package:monitor_me/themes/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers:[
      ChangeNotifierProvider(create: (_)=> HeadTeacherProvider()),
      ChangeNotifierProvider(create: (_)=> TeacherProvider()),
      ChangeNotifierProvider(create: (_)=> SubjectProvider()),
      ChangeNotifierProvider(create: (_)=> TopicProvider()),
      ChangeNotifierProvider(create: (_)=> ThemeNotifier()),
    ],
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
