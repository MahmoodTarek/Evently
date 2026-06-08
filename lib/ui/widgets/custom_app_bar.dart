import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? leading;
  final bool isCenter;
  final double? leadingWidth;
  final EdgeInsets titlePadding;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.title,
    this.leading,
    this.isCenter = true,
    this.leadingWidth,
    this.titlePadding = const EdgeInsets.only(left: 16),
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      leading: Padding(padding: titlePadding, child: leading),
      actions: actions,
      centerTitle: isCenter,
      leadingWidth: leadingWidth,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
