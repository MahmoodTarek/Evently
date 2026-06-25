import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/model/event.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/ui/bottom_nav/tabs/home/widgets/event_card.dart';
import 'package:evently/ui/screens/on_boarding/widgets/custom_form_field.dart';
import 'package:evently/ui/widgets/custom_empty_screen.dart';
import 'package:evently/utils/app_theme_extension.dart';
import 'package:evently/utils/resources/app_assets.dart';
import 'package:evently/utils/resources/app_routes.dart';
import 'package:evently/utils/resources/app_styles.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late final TextEditingController _searchController;
  late final EventsProvider eventsProvider;

  @override
  void dispose() {
    _searchController.clear();
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    eventsProvider = Provider.of<EventsProvider>(context, listen: false);
    eventsProvider.loadFavoriteEvents();
  }

  @override
  Widget build(BuildContext context) {
    final EventsProvider eventsProvider = Provider.of<EventsProvider>(context);
    final UserProvider userProvider = Provider.of<UserProvider>(context);
    final List<Event> events = _searchController.text.isEmpty
        ? eventsProvider.favoriteEvents
        : eventsProvider.searchResults;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            if (eventsProvider.favoriteEvents.isEmpty)
              CustomEmptyScreen(
                title: AppLocalizations.of(context)!.no_favorites_title,
                description: AppLocalizations.of(
                  context,
                )!.no_favorites_description,
                height: context.height,
                width: context.width,
              )
            else
              CustomFormField(
                controller: _searchController,
                validator: (value) => null,
                onChanged: (value) {
                  eventsProvider.searchEvents(value);
                },
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
              itemCount: events.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: EventCard(
                  event: Event(
                    category: events[index].category,
                    imageUrl: events[index].imageUrl,
                    title: events[index].title,
                    date: events[index].date,
                    isFavorite: events[index].isFavorite,
                    description: '',
                    time: '',
                  ),
                  onFavIconTap: (isFavorite) {
                    eventsProvider.toggleFavorite(
                      eventId: events[index].id,
                      uId: userProvider.currentUser!.id,
                    );
                  },
                  onTap: onEventTab(events[index].id),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void Function()? onEventTab(String eventId) {
    return () {
      Navigator.pushNamed(context, AppRoutes.eventDetails, arguments: eventId);
    };
  }
}
