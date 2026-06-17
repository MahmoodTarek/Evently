import 'package:evently/data/categories.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/event_card.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/home_welcome_bar.dart';
import 'package:evently/ui/widgets/custom_selected_items_row.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 24,
        children: [
          paddingOrientational(child: HomeWelcomeBar(username: 'John Doe')),

          CustomSelectedItemsRow(
            initialValue: allCategories(context).first.name,
            optionsTitle: allCategories(context).map((e) => e.name).toList(),
            optionsIcon: allCategories(context).map((e) => e.image).toList(),
            labelBuilder: (String item) => item,
            onSelected: (String item) => print(item),
          ),
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom: 24),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.eventDetails);
                },
                child: EventCard(
                  category: categories(context).first.name,
                  backgroundImage: AppImages.imgLightCategoryBirthday,
                  title: 'This is a Birthday Party ',
                  date: '21 Jan',
                  isFavorite: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget paddingOrientational({
  required Widget child,
  double horizontal = 16,
  double vertical = 8,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    child: child,
  );
}
