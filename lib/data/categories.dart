import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/category.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<Category> allCategories(BuildContext context) {
  return [
    Category(
      id: 0,
      name: AppLocalizations.of(context)!.category_all,
      image: AppIcons.icCategoryAll,
    ),
    Category(
      id: 1,
      name: AppLocalizations.of(context)!.category_sport,
      image: AppIcons.icCategorySport,
    ),
    Category(
      id: 2,
      name: AppLocalizations.of(context)!.category_birthday,
      image: AppIcons.icCategoryBirthday,
    ),
    Category(
      id: 3,
      name: AppLocalizations.of(context)!.category_book_club,
      image: AppIcons.icCategoryBookClub,
    ),
    Category(
      id: 4,
      name: AppLocalizations.of(context)!.category_exhibition,
      image: AppIcons.icCategoryExhibition,
    ),
  ];
}

List<Category> categories(BuildContext context) {
  return [
    Category(
      id: 0,
      name: AppLocalizations.of(context)!.category_sport,
      image: AppIcons.icCategorySport,
    ),
    Category(
      id: 1,
      name: AppLocalizations.of(context)!.category_birthday,
      image: AppIcons.icCategoryBirthday,
    ),
    Category(
      id: 2,
      name: AppLocalizations.of(context)!.category_book_club,
      image: AppIcons.icCategoryBookClub,
    ),
    Category(
      id: 3,
      name: AppLocalizations.of(context)!.category_exhibition,
      image: AppIcons.icCategoryExhibition,
    ),
  ];
}
