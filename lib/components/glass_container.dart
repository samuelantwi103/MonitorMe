// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final BorderRadiusGeometry borderRadius;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;
  const GlassContainer({
    super.key,
    this.child,
    this.height,
    this.borderRadius = BorderRadius.zero,
    this.width,
    this.decoration,
    this.padding,
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
            padding: padding ?? const EdgeInsets.all(2),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: child,
            )));
  }
}

class GlassFloatingActionButton extends StatelessWidget {
  final Widget? label;
  final Widget icon;
  final void Function()? onPressed;
  const GlassFloatingActionButton(
      {super.key, this.label, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    if (label != null) {
      return GlassContainer(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(18),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          hoverElevation: 0,
          focusElevation: 0,
          clipBehavior: Clip.antiAlias,
          onPressed: onPressed,
          icon: icon,
          label: label!,
          // isExtended: isFABHovered,
        ),
      );
    } else {
      return GlassContainer(
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(18),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          foregroundColor: Theme.of(context).colorScheme.onSurface,
          elevation: 0,
          hoverElevation: 0,
          focusElevation: 0,
          clipBehavior: Clip.antiAlias,
          onPressed: onPressed,
          child: icon,
          // isExtended: isFABHovered,
        ),
      );
    }
  }
}
