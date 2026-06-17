import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';

class FirebaseUtils {
  static CollectionReference<Event> getEventsCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, _) => Event.fromFirestore(snapshot.data()!),
          toFirestore: (event, _) => event.toFirestore(),
        );
  }

  static Future<void> addEvent({required Event event}) {
    final collectionRef = getEventsCollection(); // create a new Collection
    var docRef = collectionRef
        .doc(); // Create a new document with an auto-generated ID
    event.id = docRef.id; // Set the ID of the event
    return docRef.set(event); // Add the event to the Firestore collection
  }
}
