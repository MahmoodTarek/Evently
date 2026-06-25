import 'package:evently/model/user.dart';
import 'package:flutter/cupertino.dart';

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

  void logout() {
    currentUser = null;
    notifyListeners();
  }
}
