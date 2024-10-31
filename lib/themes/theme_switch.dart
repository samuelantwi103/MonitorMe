// ../../washking/washking/lib/themes/theme_switch.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:monitor_me/themes/theme_provider.dart';

class ThemeSwitch extends StatefulWidget {
  const ThemeSwitch({super.key});

  @override
  State<ThemeSwitch> createState() => _ThemeSwitchState();
}

class _ThemeSwitchState extends State<ThemeSwitch> {
  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeNotifier>(context, listen: true).isDarkMode;
    return Switch.adaptive(
      value: isDark,
      thumbIcon: WidgetStatePropertyAll(
        Icon(
          isDark
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined,
              color:isDark
              ? Theme.of(context).colorScheme.secondary:null,
        ),
      ),
      onChanged: (value) {
        Provider.of<ThemeNotifier>(context, listen: false).toggleTheme();
      },
    );
  }
}
