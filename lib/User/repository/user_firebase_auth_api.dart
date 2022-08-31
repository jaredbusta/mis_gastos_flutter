import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// contiene toda la logica de la conexion con firebaseauth
class UserFirebaseAuthAPI {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Future<UserCredential> signIn() async {
    // se solicita el recuadro de dialogo de auth
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication? gsa = await googleSignInAccount?.authentication;
    UserCredential user = await _auth.signInWithCredential(
        GoogleAuthProvider.credential(
            idToken: gsa?.idToken, accessToken: gsa!.accessToken));
    return user;
  }

  void signOut() async {
    await _auth.signOut().then((value) => print("Sesión cerrada en fireabase"));
    await googleSignIn
        .signOut()
        .then((value) => print("Sesión cerrada en Google"));
  }
}
