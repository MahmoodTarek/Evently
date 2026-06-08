import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/widgets/directional_icon.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnBoardingAppBar({
    super.key,
    required this.currentPage,
    required this.onSkip,
    required this.onBack,
  });

  final int currentPage;
  final VoidCallback onSkip;
  final VoidCallback onBack;

  static const int _lastPageIndex = 3;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final isDark = context.isDark;

    final logoPath = isDark
        ? AppImages.logoEventlyDark
        : AppImages.logoEventlyLight;

    final backIconPath = isDark ? AppIcons.icBackDark : AppIcons.icBackLight;

    final showBackButton = currentPage > 0;
    final showSkipButton = currentPage < _lastPageIndex;

    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 80,
      leadingWidth: 60,
      shadowColor: Colors.transparent,
      titleSpacing: 0,
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: colors.mainColor,
      centerTitle: true,
      title: Image.asset(logoPath, height: 26),
      leading: showBackButton
          ? DirectionalIcon(
              child: IconButton(
                onPressed: onBack,
                icon: SvgPicture.asset(backIconPath, width: 32, height: 32),
              ),
            )
          : null,
      actions: [
        if (showSkipButton)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: OutlinedButton(
              onPressed: onSkip,
              style: OutlinedButton.styleFrom(
                backgroundColor: colors.inputs,
                side: BorderSide(color: colors.mainColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.common_skip,
                style: AppStyles.semiBold14(
                  context: context,
                ).copyWith(color: isDark ? colors.mainText : colors.mainColor),
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
