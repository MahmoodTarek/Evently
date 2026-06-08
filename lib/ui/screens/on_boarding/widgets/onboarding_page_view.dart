import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/language_provider.dart';
import 'package:evently/provider/theme_provider.dart';
import 'package:evently/ui/screens/on_boarding/widgets/selected_card.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/app_language_extension.dart';
import '../../../../utils/app_theme_extension.dart';

class OnboardingPageView extends StatelessWidget {
  final PageController controller;
  final int totalPages;
  final bool isFirstScreen;
  final String image;
  final String title;
  final String description;

  const OnboardingPageView({
    super.key,
    required this.controller,
    required this.totalPages,
    required this.isFirstScreen,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final isArabic = context.isArabic;

    final selectedColor = context.isDark
        ? context.colors.mainText
        : context.colors.inputs;

    final unselectedColor = context.colors.mainText;

    final arabicTextColor = isArabic ? selectedColor : unselectedColor;

    final englishTextColor = !isArabic ? selectedColor : unselectedColor;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image, width: double.infinity, fit: BoxFit.contain),

          const SizedBox(height: 16),
          if (!isFirstScreen)
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: totalPages,
                effect: ExpandingDotsEffect(
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                  spacing: 6,
                  activeDotColor: context.colors.mainColor,
                  dotColor: context.colors.disable,
                ),
              ),
            ),

          const SizedBox(height: 24),

          Text(title, style: AppStyles.semiBold20()),

          const SizedBox(height: 12),

          Text(description, style: AppStyles.regular16(context: context)),

          if (isFirstScreen) ...[
            const SizedBox(height: 24),

            SelectedRow(
              title: localizations.language,
              options: [
                SelectionOption(
                  child: Text(
                    localizations.english,
                    style: AppStyles.semiBold14(
                      context: context,
                    ).copyWith(color: englishTextColor),
                  ),
                  isSelected: !context.isArabic,
                  onTap: () {
                    context.read<LanguageProvider>().changeLanguage(
                      Language.en,
                    );
                  },
                ),
                SelectionOption(
                  child: Text(
                    localizations.arabic,
                    style: AppStyles.semiBold14(
                      context: context,
                    ).copyWith(color: arabicTextColor),
                  ),
                  isSelected: context.isArabic,
                  onTap: () {
                    context.read<LanguageProvider>().changeLanguage(
                      Language.ar,
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            SelectedRow(
              title: localizations.theme,
              options: [
                SelectionOption(
                  child: SvgPicture.asset(
                    context.isDark ? AppIcons.icSunDark : AppIcons.icSunLight,
                  ),
                  isSelected: !context.isDark,
                  onTap: () {
                    context.read<ThemeProvider>().changeTheme(
                      newThemeMode: ThemeMode.light,
                    );
                  },
                ),
                SelectionOption(
                  child: SvgPicture.asset(
                    context.isDark ? AppIcons.icMoonDark : AppIcons.icMoonLight,
                  ),
                  isSelected: context.isDark,
                  onTap: () {
                    context.read<ThemeProvider>().changeTheme(
                      newThemeMode: ThemeMode.dark,
                    );
                  },
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
