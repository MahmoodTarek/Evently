import 'package:evently/provider/language_provider.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LanguageItem extends StatelessWidget {
  final Language language;
  final String title;
  final bool isSelected;

  const LanguageItem({
    super.key,
    required this.language,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final Color borderColor = isSelected
        ? context.colors.stroke
        : context.colors.inputs;

    return InkWell(
      onTap: () {
        context.read<LanguageProvider>().changeLanguage(language);
      },
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.inputs,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: borderColor),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppStyles.medium16()),
            if (isSelected)
              SvgPicture.asset(
                AppIcons.icSelectedLanguage,
                width: 20,
                height: 20,
                colorFilter: ColorFilter.mode(
                  context.colors.secText,
                  BlendMode.srcIn,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
