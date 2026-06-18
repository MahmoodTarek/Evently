import 'package:evently/ui/widgets/item_card.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSelectedItemsRow extends StatelessWidget {
  final List<String> optionsTitle;
  final List<String>? optionsIcon;
  final String? initialValue;
  final ValueChanged<String>? onSelected;
  final String Function(String)? labelBuilder;
  final double height;

  const CustomSelectedItemsRow({
    super.key,
    required this.optionsTitle,
    this.optionsIcon,
    this.initialValue,
    this.onSelected,
    this.labelBuilder,
    this.height = 48,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: optionsTitle.length,
        itemBuilder: (context, index) {
          final item = optionsTitle[index];

          return ItemCard(
            title: item,
            icon: optionsIcon != null ? optionsIcon![index] : null,
            isSelected: item == initialValue,
            onTap: () {
              onSelected?.call(item);
            },
            itemTextStyle: AppStyles.semiBold16(
              context: context,
            ).copyWith(
              color: item == initialValue
                  ? Colors.white
                  : context.colors.mainText,
            ),
          );
        },
      ),
    );
  }
}