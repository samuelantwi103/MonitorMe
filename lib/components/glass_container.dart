import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  const GlassContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    // return ClipRRect(
    //   borderRadius: BorderRadius.circular(20),
    //   child: Container(
    //     height: 100,
    //     padding: const EdgeInsets.all(2),
    // child:
    return BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: 5,
        sigmaY: 5,
      ),
      child: child,
    );
    //     ),
    //   );
    // }
  }
}
