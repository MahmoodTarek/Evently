import 'package:flutter/material.dart';

class CustomItemCard extends StatelessWidget {
  final double? height;
  final double width;
  final double borderRadius;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget child;

  const CustomItemCard({
    super.key,
    this.height,
    this.width = double.infinity,
    this.borderRadius = 16,
    this.borderColor = Colors.grey,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
        color: backgroundColor,
      ),
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}
