import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/data/firebase_utils/firebase_utils.dart';
import 'package:evently/model/event.dart';
import 'package:evently/provider/categories_provider.dart';
import 'package:flutter/material.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> events = [];

  Future<void> getEvents({CategoryType category = CategoryType.all}) async {
    try {
      print("events length Before getEvents: ${events.length}");
      Query<Event> query = FirebaseUtils.getEventsCollection();

      if (category != CategoryType.all) {
        query = query.where('category', isEqualTo: category.name);
      }

      final snapshot = await query.get();

      events = snapshot.docs.map((doc) => doc.data()).toList();

      print("events length After getEvents: ${events.length}");
      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint('Get Events Error: $e');
      debugPrintStack(stackTrace: stackTrace);
    }
  }
}
