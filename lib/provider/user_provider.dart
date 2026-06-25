import 'package:evently/model/user.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class UserProvider extends ChangeNotifier {
  User? currentUser;

  void setCurrentUser({required User user}) {
    currentUser = user;
    notifyListeners();
  }

  void changeUserImage({required String imagePath}) {
    if (currentUser != null) {
      currentUser = currentUser!.copyWith(image: imagePath);
      notifyListeners();
    }
  }

  void logout({required BuildContext context}) {
    var eventProvider = Provider.of<EventsProvider>(
      context,
      listen: false,
    );

    eventProvider.clearEvents();
    currentUser = null;
    FirebaseAuth.instance.signOut();
    notifyListeners();
  }
}
