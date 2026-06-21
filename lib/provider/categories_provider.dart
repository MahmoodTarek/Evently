import 'package:evently/model/category.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:flutter/material.dart';

enum CategoryType { all, sports, birthday, bookClub, exhibition }

class CategoriesProvider extends ChangeNotifier {
  static final List<Category> allCategories = [
    Category(
      id: '0',
      name: CategoryType.all.name,
      image: AppIcons.icCategoryAll,
    ),
    Category(
      id: '1',
      name: CategoryType.sports.name,
      image: AppIcons.icCategorySport,
    ),
    Category(
      id: '2',
      name: CategoryType.birthday.name,
      image: AppIcons.icCategoryBirthday,
    ),
    Category(
      id: '3',
      name: CategoryType.bookClub.name,
      image: AppIcons.icCategoryBookClub,
    ),
    Category(
      id: '4',
      name: CategoryType.exhibition.name,
      image: AppIcons.icCategoryExhibition,
    ),
  ];

  CategoryType selectedCategory = CategoryType.all;

  static final List<Category> categories = allCategories.skip(1).toList();

  void changeCategory(CategoryType category) {
    if (selectedCategory == category) return;

    selectedCategory = category;
    notifyListeners();
  }
}
