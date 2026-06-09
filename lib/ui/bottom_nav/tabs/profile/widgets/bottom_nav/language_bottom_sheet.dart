import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/language_provider.dart';
import 'package:evently/ui/bottom_nav/tabs/profile/widgets/bottom_nav/language_item.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = context.watch<LanguageProvider>();
    final appLocalizations = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      decoration: BoxDecoration(
        color: context.colors.background,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                appLocalizations.current_language,
                style: AppStyles.medium16(context: context),
              ),
              Text(
                languageProvider.currentLanguage == Language.en
                    ? appLocalizations.english
                    : appLocalizations.arabic,
                style: AppStyles.medium16(context: context),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LanguageItem(
            language: Language.en,
            title: appLocalizations.english,
            isSelected: languageProvider.currentLanguage == Language.en,
          ),

          LanguageItem(
            language: Language.ar,
            title: appLocalizations.arabic,
            isSelected: languageProvider.currentLanguage == Language.ar,
          ),
        ],
      ),
    );
  }
}
