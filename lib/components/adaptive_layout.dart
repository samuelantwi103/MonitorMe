// components/adaptive_layout.dart
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';

class AppLayout extends StatefulWidget {
  final List<Map<String, dynamic>> destinationData;
  final bool showSecondaryBody;
  final Widget? trailingNavRail;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  const AppLayout({
    super.key,
    required this.destinationData,
    this.showSecondaryBody = true,
    this.trailingNavRail,
    this.scaffoldKey,
  });

  @override
  State<AppLayout> createState() => _AppLayoutState();
}

bool extended = false;
int selectedIndex = 0;

class _AppLayoutState extends State<AppLayout> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Dynamically build the NavigationDestination list
    final destinations = widget.destinationData.map((data) {
      return NavigationDestination(

        icon: data['icon'] as Icon,
        label: data['label'] as String,
        selectedIcon: data['selectedIcon'] as Icon,
      );
    }).toList();

  //   final bottomNavbarItems =  widget.destinationData.map((data) {
  //   final icon = data['icon'] as Icon;
  //   final selectedIcon = data['selectedIcon'] as Icon;
  //   return BottomNavigationBarItem(
  //     icon: icon,
  //     label: data['label'] as String,
  //     activeIcon: selectedIcon,
  //   );
  // }).toList();

    // final bottomNavItems = widget.destinationData.map((data) {
    //   final icon = data['icon'] as Icon;
    //   final selectedIcon = data['selectedIcon'] as Icon;
    //   return GButton(
    //     icon: icon.icon!,
    //     text: data['label'] as String,
    //     // label: data['label'] as String,
    //     // selectedIcon: selectedIcon.icon,
    //   );
    // }).toList();

    final secondaryChildren = widget.destinationData.map(
      (data) {
        return data['secondaryPage'];
      },
    ).toList();

    final children = widget.destinationData.map(
      (data) {
        return data['page'];
      },
    ).toList();

    // final smallActions = widget.destinationData.map(
    //   (data) {
    //     return IconButton(onPressed: () {}, icon: data['icon'] as Icon);
    //   },
    // ).toList();

    // final largeActions = widget.destinationData.map(
    //   (data) {
    //     return TextButton(
    //       onPressed: () {},
    //       child: Row(
    //         children: [
    //           data['icon'] as Icon,
    //           Text(data['label']),
    //         ],
    //       ),
    //     );
    //   },
    // ).toList();

    return Scaffold(
      body: AdaptiveLayout(
        transitionDuration: const Duration(milliseconds: 500),
        bodyRatio: 0.6,

        secondaryBody: !widget.showSecondaryBody || secondaryChildren.isEmpty
            ? null
            : (secondaryChildren[selectedIndex] == null)
                ? null
                : SlotLayout(config: {
                    Breakpoints.mediumAndUp: SlotLayout.from(
                      key: const Key('Body Medium'),
                      builder: (context) => secondaryChildren[selectedIndex]!,
                    ),
                    Breakpoints.largeAndUp: SlotLayout.from(
                      key: const Key('Body Large'),
                      builder: (context) =>
                          (secondaryChildren[selectedIndex] == null)
                              ? null
                              : secondaryChildren[selectedIndex]!,
                    ),
                  }),
        primaryNavigation: SlotLayout(
          config: {
            Breakpoints.medium: SlotLayout.from(
              // outAnimation: ,
              key: const Key("Primary Navigation Medium"),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                extended: extended,
                selectedIndex: selectedIndex,
                // width: 72,

                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                destinations: destinations
                    .map((destination) =>
                        AdaptiveScaffold.toRailDestination(destination))
                    .toList(),
                trailing: widget.trailingNavRail,
              ),
            ),
            Breakpoints.mediumLarge: SlotLayout.from(
              key: const Key("Primary Navigation MediumLarge"),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                extended: true,
                destinations: destinations
                    .map((destination) =>
                        AdaptiveScaffold.toRailDestination(destination))
                    .toList(),
                trailing: widget.trailingNavRail,
              ),
            ),
            Breakpoints.largeAndUp: SlotLayout.from(
              key: const Key("Primary Navigation Large"),
              builder: (context) => AdaptiveScaffold.standardNavigationRail(
                selectedIndex: selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                extended: true,
                destinations: destinations
                    .map((destination) =>
                        AdaptiveScaffold.toRailDestination(destination))
                    .toList(),
                trailing: widget.trailingNavRail,
              ),
            ),
          },
        ),

        // Main Body
        body: SlotLayout(config: {
          Breakpoints.small: SlotLayout.from(
            key: const Key('Body Small'),
            builder: (context) => Padding(
                padding: const EdgeInsets.all(0),
                child: children[selectedIndex]),
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('Body Medium'),
            builder: (context) => Padding(
                padding: const EdgeInsets.all(0),
                child: children[selectedIndex]),
          ),
          Breakpoints.largeAndUp: SlotLayout.from(
            key: const Key('Body Large'),
            builder: (context) => children[selectedIndex],
          ),
          // ),
        }),

        // Bottom Navigation
        bottomNavigation: SlotLayout(config: {
          Breakpoints.small: SlotLayout.from(
              key: const Key("Bottom Navigation Small"),
              inAnimation: AdaptiveScaffold.bottomToTop,
              outAnimation: AdaptiveScaffold.topToBottom,
              builder: (context) =>
                  // GlassContainer(
                  //   child:NavigationBar(
                  //   backgroundColor: Colors.transparent,
                  //     destinations: destinations,
                  //     selectedIndex: selectedIndex,
                  //     onDestinationSelected: (index) {
                  //       setState(() {
                  //         selectedIndex = index;
                  //       });
                  //     },
                  //   ),
                  // )
              AdaptiveScaffold.standardBottomNavigationBar(
                destinations: destinations,
                currentIndex: selectedIndex,
                onDestinationSelected: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              ),

          //  GNav(
          //   tabs: bottomNavItems,
          // ),
          // ),
        }),
      ),
    );
  }
}
