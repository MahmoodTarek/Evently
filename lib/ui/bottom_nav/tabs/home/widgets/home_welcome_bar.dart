import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/utils/app_language_extension.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeWelcomeBar extends StatelessWidget {
  final String username;

  const HomeWelcomeBar({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .start,
      mainAxisAlignment: .spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.home_welcome_back,
              style: AppStyles.regular14(
                context: context,
              ).copyWith(color: context.colors.secText),
            ),
            Text(
              username,
              style: AppStyles.medium20(
                context: context,
              ).copyWith(color: context.colors.mainColor),
            ),
          ],
        ),
        Row(
          spacing: 8,
          children: [
            SvgPicture.asset(
              context.isDark ? AppIcons.icMoonDark : AppIcons.icSunDark,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                context.isDark
                    ? context.colors.secText
                    : context.colors.mainColor,
                BlendMode.srcIn,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: context.colors.mainColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5.5),
              child: Text(
                context.isArabic
                    ? AppLocalizations.of(context)!.language_short_ar
                    : AppLocalizations.of(context)!.language_short_en,
                style: AppStyles.semiBold14(context: context).copyWith(
                  color: context.isDark
                      ? context.colors.secText
                      : context.colors.inputs,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
