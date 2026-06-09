import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

typedef OnPressed = void Function()?;

class CustomElevatedButton extends StatelessWidget {
  final Widget child;

  final OnPressed? onPressed;

  final Color? backgroundColor;
  final Color? borderColor;

  final double? radius;

  final TextStyle? textStyle;

  final double? horizontalPadding;

  final double? verticalPadding;

  const CustomElevatedButton({
    super.key,

    required this.child,
    required this.onPressed,
    this.backgroundColor,
    this.borderColor,
    this.radius,
    this.textStyle,
    this.horizontalPadding,
    this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 56),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor ?? Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(radius ?? 15),
        ),
        padding: EdgeInsets.symmetric(vertical: verticalPadding ?? 8),
        textStyle: textStyle ?? AppStyles.medium20(context: context),
      ),
      child: child,
    );
  }
}
