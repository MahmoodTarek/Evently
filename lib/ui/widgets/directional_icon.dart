import 'dart:math' show pi;

import 'package:flutter/material.dart';

class DirectionalIcon extends StatelessWidget {
  final Widget child;

  const DirectionalIcon({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Transform(
      transform: Matrix4.rotationY(isRTL ? pi : 0),
      alignment: Alignment.center,
      child: child,
    );
  }
}
