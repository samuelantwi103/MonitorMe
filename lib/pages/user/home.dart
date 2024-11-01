import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:monitor_me/components/bottom_navbar.dart';
import 'package:monitor_me/components/glass_container.dart';

import 'package:monitor_me/pages/auth/sign_in.dart';
// import 'package:washking/components/glass_container.dart';
import 'package:monitor_me/pages/user/dashboard.dart';
import 'package:monitor_me/pages/user/settings.dart';
import 'package:monitor_me/services/transitions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentPage,
        children: const [
          UserDashboardPage(),
          // UserDashboardPage(),
          UserSettingsPage(),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: GlassContainer(
              // width: 50,
              decoration: BoxDecoration(
                  color:
                      Theme.of(context).colorScheme.primary.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(100),
              child: GNav(
                mainAxisAlignment: MainAxisAlignment.center,
                // backgroundColor: Colors.transparent,
                // activeColor: Theme.of(context).colorScheme.onPrimary,
                tabMargin: const EdgeInsets.only(
                  bottom: 10,
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                tabBackgroundColor:
                    Theme.of(context).colorScheme.primaryContainer,
                gap: 5,
                padding: const EdgeInsets.all(15),
                tabs: const [
                  GButton(
                    icon: Icons.dashboard_outlined,
                    text: 'Dashboard',
                  ),
                  GButton(
                    icon: Icons.settings_outlined,
                    text: 'Settings',
                  )
                  // NavigationDestination(
                  //   icon: Icon(Icons.dashboard_outlined),
                  //   label: 'Dashboard',
                  //   selectedIcon: Icon(Icons.dashboard),
                  // ),
                  // NavigationDestination(
                  //   icon: Icon(Icons.settings_outlined),
                  //   label: 'Settings',
                  //   selectedIcon: Icon(Icons.settings),
                  // ),
                ],
                selectedIndex: currentPage,
                onTabChange: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );

    //     const AppLayout(
    //   destinationData: [
    //     {
    //       'icon': Icon(Icons.dashboard_outlined),
    //       'selectedIcon': Icon(Icons.dashboard),
    //       'label': 'Dashboard',
    //       'page': UserDashboardPage(),
    //       'secondaryPage': null,
    //     },
    //     {
    //       'icon': Icon(Icons.assessment_outlined),
    //       'selectedIcon': Icon(Icons.assessment),
    //       'label': 'Assessments',
    //       'page': UserDashboardPage(),
    //       'secondaryPage': null,
    //     },
    //     // {
    //     //   'icon': Icon(Icons.article_outlined),
    //     //   'selectedIcon': Icon(Icons.article),
    //     //   'label': 'Mocks',
    //     //   'page': UserDashboardPage(),
    //     //   'secondaryPage': null,
    //     // },
    //     {
    //       'icon': Icon(Icons.settings_outlined),
    //       'selectedIcon': Icon(Icons.settings),
    //       'label': 'Settings',
    //       'page': UserDashboardPage(),
    //       'secondaryPage': UserDashboardPage(),
    //     },
    //   ],
    // );
  }
}
