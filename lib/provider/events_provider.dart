import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/data/firebase_utils/firebase_utils.dart';
import 'package:evently/model/event.dart';
import 'package:evently/provider/categories_provider.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> events = [];
  List<Event> favoriteEvents = [];
  List<Event> searchResults = [];

  Future<void> getEvents({
    CategoryType category = CategoryType.all,
    required String uId,
  }) async {
    try {
      Query<Event> query = FirebaseUtils.getEventsCollection(uId: uId);

      if (category != CategoryType.all) {
        query = query.where('category', isEqualTo: category.name);
      }

      final snapshot = await query.orderBy('date', descending: false).get();

      events = snapshot.docs.map((doc) => doc.data()).toList();

      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint('Get Events Error: $e');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  void loadFavoriteEvents() {
    favoriteEvents = events.where((e) => e.isFavorite).toList();
    searchResults = favoriteEvents;
    notifyListeners();
  }

  Future<void> toggleFavorite({
    required String eventId,
    required String uId,
  }) async {
    final index = events.indexWhere((e) => e.id == eventId);
    if (index == -1) return;

    final currentValue = events[index].isFavorite;
    final newValue = !currentValue;

    events[index].isFavorite = newValue;

    loadFavoriteEvents();
    notifyListeners();

    try {
      await FirebaseUtils.getEventsCollection(
        uId: uId,
      ).doc(eventId).update({'isFavorite': newValue});
    } catch (e) {
      events[index].isFavorite = currentValue;

      loadFavoriteEvents();
      notifyListeners();

      debugPrint('Toggle Favorite Error: $e');
    }
  }

  void searchEvents(String query) {
    if (query.isEmpty) {
      searchResults = favoriteEvents;
    } else {
      searchResults = favoriteEvents.where((event) {
        final q = query.toLowerCase();

        return event.title.toLowerCase().contains(q) ||
            event.description.toLowerCase().contains(q) ||
            event.date.toString().toLowerCase().contains(q) ||
            event.time.toLowerCase().contains(q) ||
            event.category.toString().toLowerCase().contains(q);
      }).toList();
    }

    notifyListeners();
  }

  Event getEventById(String eventId) {
    return events.firstWhere((event) => event.id == eventId);
  }

  void clearEvents() {
    events.clear();
    favoriteEvents.clear();
    searchResults.clear();
    notifyListeners();
  }
}
