import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.leading,
    this.title,
    this.titleWidget,
    this.actions,
    this.centerTitle = true,
    this.height = 80,
  });

  final Widget? leading;
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final bool centerTitle;
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      leadingWidth: 60,
      shadowColor: Colors.transparent,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: centerTitle,
      leading: leading,
      title:
          titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: AppStyles.medium18(
                    context: context,
                  ).copyWith(color: context.colors.mainText),
                )
              : null),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
