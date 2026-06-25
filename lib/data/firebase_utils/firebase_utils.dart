import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';
import 'package:evently/model/user.dart';

class FirebaseUtils {
  FirebaseUtils._();

  static CollectionReference<User> getUsersCollection() {
    return FirebaseFirestore.instance
        .collection(User.collectionName)
        .withConverter<User>(
      fromFirestore: (snapshot, _) => User.fromFirestore(snapshot.data()!),
      toFirestore: (user, _) => user.toFirestore(),
    );
  }

  static Future<void> addUserToFirebase({required User user}) {
    return getUsersCollection().doc(user.id).set(user);
  }

  static Future<User?> getUserFromFirebase(String userId) async {
    return await getUsersCollection().doc(userId).get().then((snapshot) {
      if (snapshot.exists) {
        return snapshot.data();
      } else {
        return null;
      }
    });
  }

  static Future<void> updateUserInFirebase({required User user}) {
    return getUsersCollection().doc(user.id).update(user.toFirestore());
  }

  static CollectionReference<Event> getEventsCollection({required String uId}) {
    return getUsersCollection().doc(uId)
        .collection(Event.collectionName)
        .withConverter<Event>(
      fromFirestore: (snapshot, _) => Event.fromFirestore(snapshot.data()!),
      toFirestore: (event, _) => event.toFirestore(),
    );
  }

  static Future<void> addEvent({required Event event, required String uId}) {
    final collectionRef = getEventsCollection(
        uId: uId); // create a new Collection
    var docRef = collectionRef
        .doc(); // Create a new document with an auto-generated ID
    event.id = docRef.id; // Set the ID of the event
    return docRef.set(event); // Add the event to the Firestore collection
  }

  static Future<void> updateEvent({required Event event, required String uId}) {
    final collectionRef = getEventsCollection(uId: uId);
    var docRef = collectionRef.doc(event.id);
    return docRef.update(event.toFirestore());
  }
}
