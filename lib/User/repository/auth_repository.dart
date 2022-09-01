import 'package:firebase_auth/firebase_auth.dart';
import 'user_firebase_auth_api.dart';

class AuthRepository {
  final _firebaseAuthAPI = UserFirebaseAuthAPI();
  Future<UserCredential> signFirebase() => _firebaseAuthAPI.signIn();
  void signOutFirebase() => _firebaseAuthAPI.signOut();
}
