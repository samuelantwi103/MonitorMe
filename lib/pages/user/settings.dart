import 'package:flutter/material.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/themes/theme_switch.dart';

class UserSettingsPage extends StatefulWidget {
  const UserSettingsPage({super.key});

  @override
  State<UserSettingsPage> createState() => _UserSettingsPageState();
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.maxFinite, 60),
        child: GlassContainer(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
          child: AppBar(
            // leadingWidth: 50,
            // foregroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            title: Text(
              "Settings",
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .surfaceContainerHighest),
                  height: 80,
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Theme",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const ThemeSwitch(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
