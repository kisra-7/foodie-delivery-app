import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // get instance of firebase authentacation

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // get current user

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // sign in

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    }
  }

  // sign up

  Future<UserCredential> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential;
    } on FirebaseException catch (e) {
      throw e.toString();
    }
  }

  // sign out

  Future<void> logOut() async {
    return await _auth.signOut();
  }
}
