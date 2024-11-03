import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:monitor_me/backend/classes.dart';
import 'package:monitor_me/components/glass_container.dart';
import 'package:monitor_me/components/text_field.dart';
import 'package:monitor_me/pages/auth/sign_in.dart';
import 'package:monitor_me/services/callback.dart';
import 'package:monitor_me/services/transitions.dart';
import 'package:monitor_me/themes/theme_switch.dart';
import 'package:provider/provider.dart';

class AdminSettingsPage extends StatefulWidget {
  const AdminSettingsPage({super.key});

  @override
  State<AdminSettingsPage> createState() => _AdminSettingsPageState();
}

class _AdminSettingsPageState extends State<AdminSettingsPage> {
  List<Map<String, dynamic>> subjects = [];
  @override
  Widget build(BuildContext context) {
    final headTeacher =
        Provider.of<HeadTeacherProvider>(context, listen: true).currentTeacher;
    subjects = headTeacher!.subjects!;
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
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 10),
                // Align( 
                //   alignment: Alignment.centerRight,
                //   child: FilledButton.tonalIcon(
                //     onPressed: () {},
                //     style: const ButtonStyle(
                //       padding: WidgetStatePropertyAll(
                //         EdgeInsets.symmetric(
                //           horizontal: 25,
                //           vertical: 20,
                //         ),
                //       ),
                //     ),
                //     label: const Text("Logout"),
                //     icon: const Icon(Icons.logout_rounded),
                //   ),
                // ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${headTeacher.headTeacherInfo!['name']} SHS",
                    style: GoogleFonts.martelSans(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                // const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Head Teacher: Mr. ${headTeacher.headTeacherInfo!['head']}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Teachers: 1",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Subjects: ${subjects.length}",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    "Location: Berekuso, Eastern Region-Ghana",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Contact: 0258 695 848",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(height: 25),
                const Divider(
                  thickness: 5,
                  indent: 15,
                  endIndent: 15,
                ),
                const SizedBox(height: 25),
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

//
Widget settingsFAB(BuildContext context) {
  return GlassFloatingActionButton(
    icon: const Icon(Icons.logout_rounded),
    label: const Text("Logout"),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        blurTransition(
          const SigninPage(),
        ),
      );
    },
  );
}

Widget userSettingsFAB(BuildContext context) {
  return GlassFloatingActionButton(
    icon: const Icon(Icons.logout_rounded),
    label: const Text("Logout"),
    onPressed: () {
      Navigator.pushReplacement(
        context,
        blurTransition(
          const SigninPage(),
        ),
      );
    },
  );
}