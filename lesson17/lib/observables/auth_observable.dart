import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
import 'package:shopping_list/models/user_model.dart';

part 'auth_observable.g.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthState = _AuthState with _$AuthState;

abstract class _AuthState with Store {
  _AuthState();

  @observable
  bool loggedIn = _auth.currentUser != null ? true : false;

  @action
  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      UserCredential result =
          await _auth.signInWithCredential(credential);

      if (result.user?.uid != null || _auth.currentUser != null) {
        loggedIn = true;
      }

      return result;
    }
  }

  @action
  Future<UserCredential?> signInWithGoogleWeb() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();
    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    return FirebaseAuth.instance.signInWithPopup(googleProvider);
  }

  @action
  Future<dynamic> signIn() async {
    if (kIsWeb) {
      signInWithGoogleWeb();
    } else {
      signInWithGoogle();
    }
  }

  @action
  Future<bool> signOut() async {
    _googleSignIn.signOut();
    _auth.signOut();
    loggedIn = false;
    return await Future.value(true);
  }

  Stream<String?> get onAuthStateChanged {
    return _auth.authStateChanges().map((User? user) => user?.uid);
  }

  @action
  getGoogleUser() async {
      GoogleSignInAccount? googleUser = _googleSignIn.currentUser;
      googleUser ??= await _googleSignIn.signInSilently();
      googleUser ??= await _googleSignIn.signIn();
      return googleUser;
  }

  @action
  Future<UserModel> currentUser() async {
    final User? user = _auth.currentUser;
    return UserModel(uid: user!.uid, email: user.email!, displayName: user.displayName!);
  }
}
