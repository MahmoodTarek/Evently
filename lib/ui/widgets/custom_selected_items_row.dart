import 'package:evently/ui/widgets/item_card.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSelectedItemsRow<T> extends StatefulWidget {
  final List<String> optionsTitle;
  final List<String>? optionsIcon;
  final String? initialValue;
  final ValueChanged<String>? onSelected;
  final String Function(String)? labelBuilder;
  final double? height;

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
  State<CustomSelectedItemsRow<T>> createState() =>
      _CustomSelectedItemsRowState<T>();
}

class _CustomSelectedItemsRowState<T> extends State<CustomSelectedItemsRow<T>> {
  late String? selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.optionsTitle.length,
        itemBuilder: (context, index) {
          final item = widget.optionsTitle[index];

          return ItemCard(
            item: item,
            isSelected: item == selectedItem,
            onTap: () {
              setState(() {
                selectedItem = item;
              });
            },
            icon: widget.optionsIcon != null
                ? widget.optionsIcon![index]
                : null,
            itemTextStyle: AppStyles.semiBold16(context: context).copyWith(
              color: item == selectedItem
                  ? Colors.white
                  : context.colors.mainText,
            ),
          );
        },
      ),
    );
  }
}
