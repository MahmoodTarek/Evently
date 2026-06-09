import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/onboarding_page_data.dart';
import 'package:evently/ui/widgets/custom_app_bar.dart';
import 'package:evently/ui/widgets/directional_icon.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingAppbar extends StatelessWidget implements PreferredSizeWidget {
  final int currentPage;
  final PageController controller;
  final List<OnBoardingPageData> pagesData;
  final void Function() goToPreviousPage;
  final void Function(int) skipToLastPage;

  const OnboardingAppbar({
    super.key,
    required this.currentPage,
    required this.controller,
    required this.pagesData,
    required this.goToPreviousPage,
    required this.skipToLastPage,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      titleWidget: Image.asset(
        context.isDark ? AppImages.logoEventlyDark : AppImages.logoEventlyLight,
        height: 26,
      ),
      leading: currentPage > 0
          ? DirectionalIcon(
              child: IconButton(
                onPressed: () => goToPreviousPage(),
                icon: SvgPicture.asset(
                  context.isDark ? AppIcons.icBackDark : AppIcons.icBackLight,
                  width: 32,
                  height: 32,
                ),
              ),
            )
          : null,
      actions: [
        if (currentPage < pagesData.length - 1)
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: OutlinedButton(
              onPressed: () => skipToLastPage(pagesData.length - 1),
              style: OutlinedButton.styleFrom(
                backgroundColor: context.colors.inputs,
                side: BorderSide(color: context.colors.mainColor),
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
                style: AppStyles.semiBold14(context: context).copyWith(
                  color: context.isDark
                      ? context.colors.mainText
                      : context.colors.mainColor,
                ),
              ),
            ),
          ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
