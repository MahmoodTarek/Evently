import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/app_theme_extension.dart';

class ActionCard extends StatelessWidget {
  final String title;
  final Widget actionIcon;
  final EdgeInsets padding;

  const ActionCard({
    super.key,
    required this.title,
    required this.actionIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colors.inputs,
        border: Border.all(width: 1, color: context.colors.stroke),

        borderRadius: BorderRadius.circular(16),
      ),
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.medium16(
              context: context,
            ).copyWith(color: context.colors.mainText),
          ),
          actionIcon,
        ],
      ),
    );
  }
}
