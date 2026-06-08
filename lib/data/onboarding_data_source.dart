import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/onboarding_page_data.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:flutter/material.dart';

List<OnBoardingPageData> pages(BuildContext context) {
  final lang = AppLocalizations.of(context)!;

  return context.isDark
      ? [
          OnBoardingPageData(
            image: AppImages.imgOnBoardingPersonalDark,
            title: lang.onboarding_personalize_title,
            description: lang.onboarding_personalize_description,
          ),
          OnBoardingPageData(
            image: AppImages.imgOnBoardingEventDark,
            title: lang.onboarding_discover_events_title,
            description: lang.onboarding_discover_events_description,
          ),
          OnBoardingPageData(
            image: AppImages.imgOnBoardingPlanningDark,
            title: lang.onboarding_event_planning_title,
            description: lang.onboarding_event_planning_description,
          ),
          OnBoardingPageData(
            image: AppImages.imgOnBoardingSocialDark,
            title: lang.onboarding_social_title,
            description: lang.onboarding_social_description,
          ),
        ]
      : [
          OnBoardingPageData(
            image: AppImages.imgOnBoardingPersonalLight,
            title: lang.onboarding_personalize_title,
            description: lang.onboarding_personalize_description,
          ),
          OnBoardingPageData(
            image: AppImages.imgOnBoardingEventLight,
            title: lang.onboarding_discover_events_title,
            description: lang.onboarding_discover_events_description,
          ),
          OnBoardingPageData(
            image: AppImages.imgOnBoardingPlanningLight,
            title: lang.onboarding_event_planning_title,
            description: lang.onboarding_event_planning_description,
          ),
          OnBoardingPageData(
            image: AppImages.imgOnBoardingSocialLight,
            title: lang.onboarding_social_title,
            description: lang.onboarding_social_description,
          ),
        ];
}
