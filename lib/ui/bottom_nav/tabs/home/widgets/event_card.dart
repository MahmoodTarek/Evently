import 'package:evently/model/event.dart';
import 'package:evently/ui/widgets/item_card.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/formated_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final double radius;
  final double height;
  final double width;
  final void Function(bool) onFavIconTap;
  final void Function()? onTap;

  const EventCard({
    super.key,
    this.radius = 16,
    this.height = 200,
    this.width = double.infinity,
    required this.onTap,
    required this.event,
    required this.onFavIconTap,
  });

  @override
  Widget build(BuildContext context) {
    final eventImage = eventCategoryImage(event.category, context);

    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(eventImage),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(width: 1, color: context.colors.stroke),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ItemCard(
              title: event.date.formatedToDayAndMon(),
              backgroundColor: context.colors.background,
              borderColor: context.colors.stroke,
              itemTextStyle: AppStyles.semiBold16(
                context: context,
              ).copyWith(color: context.colors.mainColor),
            ),

            ItemCard(
              title: event.title,
              icon: event.isFavorite
                  ? AppIcons.selectedFavorite
                  : AppIcons.unselectedFavorite,
              isIconPrefix: false,
              width: double.infinity,
              backgroundColor: context.colors.background,
              borderColor: context.colors.stroke,
              itemTextStyle: AppStyles.medium14(context: context),
              onIconTap: () {
                onFavIconTap(event.isFavorite);
              },
            ),
          ],
        ),
      ),
    );
  }

}

String eventCategoryImage(String category, BuildContext context) {
  switch (category) {
    case 'sports':
      return context.isDark
          ? AppImages.imgDarkCategorySport
          : AppImages.imgLightCategorySport;

    case 'birthday':
      return context.isDark
          ? AppImages.imgDarkCategoryBirthday
          : AppImages.imgLightCategoryBirthday;

    case 'bookClub':
      return context.isDark
          ? AppImages.imgDarkCategoryBookClub
          : AppImages.imgLightCategoryBookClub;

    case 'exhibition':
      return context.isDark
          ? AppImages.imgDarkCategoryExhibition
          : AppImages.imgLightCategoryExhibition;

    default:
      return context.isDark
          ? AppImages.imgDarkCategoryExhibition
          : AppImages.imgLightCategoryExhibition;
  }
}

