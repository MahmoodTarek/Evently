import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/category.dart';
import 'package:evently/model/event.dart';
import 'package:evently/provider/categories_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/event_card.dart';
import 'package:evently/ui/screens/on_boarding/widgets/custom_form_field.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    final EventsProvider eventsProvider = Provider.of<EventsProvider>(context);
    final CategoriesProvider categories = Provider.of<CategoriesProvider>(
      context,
    );
    final List<Event> events = eventsProvider.events;
    final List<Category> categoriesList = CategoriesProvider.categories;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            CustomFormField(
              hintText: AppLocalizations.of(context)!.search_event_hint,
              hintStyle: AppStyles.regular14(
                context: context,
              ).copyWith(color: context.colors.mainText),
              keyboardType: TextInputType.text,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppIcons.icSearch,
                  colorFilter: ColorFilter.mode(
                    context.colors.mainColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: 24),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: EventCard(
                  event: Event(
                    category: categoriesList.first.name,
                    imageUrl: AppImages.imgLightCategoryBirthday,
                    title: 'This is a Birthday Party ',
                    date: DateTime.now(),
                    isFavorite: true,
                    description: '',
                    time: '',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
