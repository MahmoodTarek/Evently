import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/provider/categories_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/event_card.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/home_welcome_bar.dart';
import 'package:evently/ui/widgets/custom_empty_screen.dart';
import 'package:evently/ui/widgets/custom_selected_items_row.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => _HomeState();
}

class _HomeState extends State {
  late final UserProvider userProvider;
  late final String uId;

  @override
  void initState() {
    super.initState();
    userProvider = context.read<UserProvider>();
    uId = userProvider.currentUser!.id;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EventsProvider>().getEvents(
        uId: userProvider.currentUser!.id,
      );
      context.read<CategoriesProvider>().changeCategory(CategoryType.all);
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = context.watch<UserProvider>();
    final eventsProvider = context.watch<EventsProvider>();
    final categoriesProvider = context.watch<CategoriesProvider>();
    var events = eventsProvider.events;
    final categories = CategoriesProvider.allCategories;

    return SingleChildScrollView(
      child: Column(
        spacing: 24,
        children: [
          paddingOrientational(
            child: HomeWelcomeBar(
              username: userProvider.currentUser?.name ?? '',
            ),
          ),

          CustomSelectedItemsRow(
            initialValue: categoriesProvider.selectedCategory.name,
            optionsTitle: categories.map((e) => e.name).toList(),
            optionsIcon: categories.map((e) => e.image).toList(),
            labelBuilder: (item) => item,
            onSelected: (categoryName) async {
              final category = CategoryType.values.firstWhere(
                (e) => e.name == categoryName,
              );

              categoriesProvider.changeCategory(category);

              await eventsProvider.getEvents(
                category: category,
                uId: userProvider.currentUser!.id,
              );
              events = eventsProvider.events;
            },
          ),

          if (events.isEmpty)
            CustomEmptyScreen(
              title: AppLocalizations.of(context)!.no_events_title,
              description: AppLocalizations.of(context)!.no_events_description,
              height: context.height * .60,
              width: context.width,
            )
          else
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: events.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 16,
                    left: 16,
                    bottom: 16,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.eventDetails);
                    },
                    child: EventCard(
                      key: ValueKey(events[index].id),

                      event: events[index],
                      onFavIconTap: (isFavorite) async {
                        if (isFavorite) {
                          await eventsProvider.toggleFavorite(
                            eventId: events[index].id,
                            uId: uId,
                          );
                        } else {
                          await eventsProvider.toggleFavorite(
                            eventId: events[index].id,
                            uId: uId,
                          );
                        }
                      },
                    ),
                  ),
                );
              },
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
