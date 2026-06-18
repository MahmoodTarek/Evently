import 'package:evently/utils/app_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemCard extends StatelessWidget {
  final String title;
  final String? icon;

  final bool isSelected;
  final bool isIconPrefix;

  final VoidCallback? onTap;
  final VoidCallback? onIconTap;

  final String Function(String)? labelBuilder;

  final Color? backgroundColor;
  final Color? borderColor;

  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final double? width;
  final TextStyle itemTextStyle;

  const ItemCard({
    super.key,
    required this.title,
    this.icon,
    this.isSelected = false,
    this.isIconPrefix = true,
    this.onTap,
    this.onIconTap,
    this.labelBuilder,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius = 16,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.margin = const EdgeInsets.symmetric(horizontal: 4),
    this.width,
    this.itemTextStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    final bgColor =
        backgroundColor ??
        (isSelected ? context.colors.mainColor : context.colors.inputs);

    final strokeColor =
        borderColor ??
        (isSelected ? context.colors.stroke : context.colors.inputs);

    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      borderRadius: BorderRadius.circular(borderRadius),
      onTap: onTap,
      child: Container(
        width: width,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: strokeColor),
        ),
        child: Row(
          mainAxisSize: width == double.infinity
              ? MainAxisSize.max
              : MainAxisSize.min,
          mainAxisAlignment: width == double.infinity ? .spaceBetween : .center,
          children: [
            if (isIconPrefix && icon != null) ...[
              _buildIcon(context),
              const SizedBox(width: 8),
            ],

            Flexible(
              child: Text(
                labelBuilder?.call(title) ?? title,
                style: itemTextStyle,
                maxLines: 1,
                softWrap: true,
                overflow: .ellipsis,
              ),
            ),

            if (!isIconPrefix && icon != null) ...[
              const SizedBox(width: 8),
              _buildIcon(context),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildIcon(BuildContext context) {
    final iconWidget = SvgPicture.asset(
      icon!,
      width: 24,
      height: 24,
      colorFilter: ColorFilter.mode(
        isSelected ? Colors.white : context.colors.mainColor,
        BlendMode.srcIn,
      ),
    );

    if (onIconTap == null) {
      return iconWidget;
    }

    return InkWell(
      onTap: onIconTap,
      borderRadius: BorderRadius.circular(100),
      child: iconWidget,
    );
  }
}
