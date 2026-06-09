import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextDivider extends StatelessWidget {
  final String text;
  final Color? color;
  final double? height;

  const CustomTextDivider({
    super.key,
    required this.text,
    this.height,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(color: context.colors.stroke, height: height),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            text,
            style: AppStyles.medium16(context: context).copyWith(color: color),
          ),
        ),
        Expanded(
          child: Divider(color: context.colors.stroke, height: height),
        ),
      ],
    );
  }
}
