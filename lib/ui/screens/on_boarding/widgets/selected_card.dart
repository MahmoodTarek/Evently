import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/cupertino.dart';

class SelectionOption {
  final Widget child;
  final bool isSelected;
  final VoidCallback onTap;

  SelectionOption({
    required this.child,
    required this.isSelected,
    required this.onTap,
  });
}

class SelectedRow extends StatelessWidget {
  final String title;
  final List<SelectionOption> options;

  const SelectedRow({super.key, required this.title, required this.options});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.medium18(
            context: context,
          ).copyWith(color: context.colors.mainColor),
        ),
        Row(
          children: options
              .map((option) => _buildItem(context, option))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildItem(BuildContext context, SelectionOption option) {
    return GestureDetector(
      onTap: option.onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: option.isSelected
                ? context.colors.mainColor
                : context.colors.stroke,
          ),
          color: option.isSelected
              ? context.colors.mainColor
              : context.colors.inputs,
          borderRadius: BorderRadius.circular(16),
        ),

        child: option.child,
      ),
    );
  }
}
