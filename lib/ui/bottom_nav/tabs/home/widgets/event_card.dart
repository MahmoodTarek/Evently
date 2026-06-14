import 'package:evently/ui/widgets/item_card.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  final String category;
  final String backgroundImage;
  final String title;
  final String date;
  final bool isFavorite;
  final double radius;
  final double height;
  final double width;

  const EventCard({
    super.key,
    required this.category,
    required this.backgroundImage,
    required this.title,
    required this.date,
    required this.isFavorite,
    this.radius = 16,
    this.height = 200,
    this.width = double.infinity,
  });

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  late bool isFavorite = widget.isFavorite;
  late String iconFav = isFavorite
      ? AppIcons.selectedFavorite
      : AppIcons.unselectedFavorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.backgroundImage),
          fit: BoxFit.cover,
          alignment: .center,
        ),
        borderRadius: BorderRadius.circular(widget.radius),
        border: Border.all(width: 1, color: context.colors.stroke),
      ),
      child: Column(
        mainAxisAlignment: .spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemCard(
            title: widget.date,
            backgroundColor: context.colors.background,
            borderColor: context.colors.stroke,
            itemTextStyle: AppStyles.semiBold16(
              context: context,
            ).copyWith(color: context.colors.mainColor),
          ),

          ItemCard(
            title: widget.title,
            icon: iconFav,
            isIconPrefix: false,
            width: double.infinity,
            backgroundColor: context.colors.background,
            borderColor: context.colors.stroke,
            itemTextStyle: AppStyles.medium14(context: context),
            onIconTap: () {
              setState(() {
                isFavorite = !isFavorite;
                iconFav = isFavorite
                    ? AppIcons.selectedFavorite
                    : AppIcons.unselectedFavorite;
              });
            },
          ),
        ],
      ),
    );
  }
}
