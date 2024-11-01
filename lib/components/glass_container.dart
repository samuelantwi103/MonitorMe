// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final BorderRadiusGeometry borderRadius;
  final double? width;
  final Decoration? decoration;
  const GlassContainer({
    super.key,
    this.child,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.width,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: borderRadius,
        child: Container(
            height: height,
            width: width,
            decoration: decoration,
            padding: const EdgeInsets.all(2),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: child,
            )));
  }
}
