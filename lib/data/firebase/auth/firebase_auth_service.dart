import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static Future<bool> createNewAccountEmailAndPw({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } on FirebaseAuthException {
      return false;
    } catch (_) {
      return false;
    }
  }
}
