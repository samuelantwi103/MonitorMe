import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:monitor_me/components/glass_container.dart';

class GlassBottomNavbar extends StatelessWidget {
  final dynamic destinationData;

  const GlassBottomNavbar({super.key, this.destinationData});

  @override
  Widget build(BuildContext context) {
    final bottomNavItems = destinationData.map((data) {
      final icon = data['icon'] as Icon;
      // final selectedIcon = data['selectedIcon'] as Icon;
      return GButton(
        
        icon: icon.icon!,
        text: data['label'] as String,
        // label: data['label'] as String,
        // selectedIcon: selectedIcon.icon,
      );
    }).toList();

    return GlassContainer(
      child: GNav(
              tabs: bottomNavItems,
            )
    );
  }
}