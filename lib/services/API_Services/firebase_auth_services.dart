import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  final _firebase = FirebaseAuth.instance;

  Future<UserCredential> createWithEmailNdPassword(
      String email, String password) async {
    return await _firebase.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future signout() async {
    return await _firebase.signOut();
  }

  Future<UserCredential> loginWithEmailNdPassword(
      String email, String password) async {
    return await _firebase.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<GoogleSignInAccount?> loginWithGoogle() async {
    return await GoogleSignIn().signIn();
  }

  Future<UserCredential> signInAnonymously() async {
    return await _firebase.signInAnonymously();
  }
}
