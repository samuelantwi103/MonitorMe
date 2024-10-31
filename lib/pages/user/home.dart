import 'package:flutter/material.dart';
import 'package:monitor_me/components/adaptive_layout.dart';
// import 'package:washking/components/glass_container.dart';
import 'package:monitor_me/pages/user/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   extendBody: true,
        //   body: IndexedStack(
        //     index: currentPage,
        //     children: const [
        //       UserDashboardPage(),
        //       UserDashboardPage(),
        //       UserDashboardPage(),
        //     ],
        //   ),
        //   bottomNavigationBar: GlassContainer(
        //     child: NavigationBar(
        //       backgroundColor: Colors.transparent,
        //       destinations: const [
        //         NavigationDestination(
        //           icon: Icon(Icons.dashboard_outlined),
        //           label: 'Dashboard',
        //           selectedIcon: Icon(Icons.dashboard),
        //         ),
        //         NavigationDestination(
        //           icon: Icon(Icons.dashboard),
        //           label: 'Assessment',
        //           selectedIcon: Icon(Icons.dashboard),
        //         ),
        //         NavigationDestination(
        //           icon: Icon(Icons.settings_outlined),
        //           label: 'Settings',
        //           selectedIcon: Icon(Icons.settings),
        //         ),
        //       ],
        //       selectedIndex: currentPage,
        //       onDestinationSelected: (index) {
        //         setState(() {
        //           currentPage = index;
        //         });
        //       },
        //     ),
        //   ),
        // );

        const AppLayout(
      destinationData: [
        {
          'icon': Icon(Icons.dashboard_outlined),
          'selectedIcon': Icon(Icons.dashboard),
          'label': 'Dashboard',
          'page': UserDashboardPage(),
          'secondaryPage': null,
        },
        {
          'icon': Icon(Icons.assessment_outlined),
          'selectedIcon': Icon(Icons.assessment),
          'label': 'Assessments',
          'page': UserDashboardPage(),
          'secondaryPage': null,
        },
        // {
        //   'icon': Icon(Icons.article_outlined),
        //   'selectedIcon': Icon(Icons.article),
        //   'label': 'Mocks',
        //   'page': UserDashboardPage(),
        //   'secondaryPage': null,
        // },
        {
          'icon': Icon(Icons.settings_outlined),
          'selectedIcon': Icon(Icons.settings),
          'label': 'Settings',
          'page': UserDashboardPage(),
          'secondaryPage': UserDashboardPage(),
        },
      ],
    );
  }
}
