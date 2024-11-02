import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_me/components/button.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/pages/auth/sign_in.dart';
import 'package:monitor_me/services/transitions.dart';
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
        preferredSize: const Size(double.maxFinite, 60),
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
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: FilledButton.tonalIcon(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        blurTransition(
                          const SigninPage(),
                        ),
                      );
                    },
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 20,
                        ),
                      ),
                    ),
                    label: const Text("Logout"),
                    icon: const Icon(Icons.logout_rounded),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Prince Philips",
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(
                  indent: 15,
                  endIndent: 15,
                ),
                const SizedBox(height: 10),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .surfaceContainerHighest),
                    height: 70,
                    padding: const EdgeInsets.symmetric(horizontal: 25),
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
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
