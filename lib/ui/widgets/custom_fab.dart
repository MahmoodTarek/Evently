import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final double? radius;
  final Color? radiusColor;
  final double elevation;
  final Color? shadowColor;

  const CustomFAB({
    super.key,
    required this.child,
    this.onPressed,
    this.backgroundColor,
    this.radius,
    this.radiusColor,
    this.elevation = 0,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: backgroundColor!.withValues(alpha: 0.56),
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: FloatingActionButton(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        elevation: elevation,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 16),
          side: BorderSide(color: radiusColor ?? Colors.grey),
        ),

        child: child,
      ),
    );
  }
}
