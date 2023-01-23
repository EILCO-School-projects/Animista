import 'package:animista/api/services/database_service.dart';
import 'package:animista/models/user.model.dart';
import 'package:animista/utils/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final String reference = 'users';
  final DatabaseService dbService = GetIt.I<DatabaseService>();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  Future<AppUser?> _userFromFirebase(User? user) async {
    if (user == null) {
      return null;
    }
    final appUser =
        await dbService.read("$reference/${escapeEmail(user.email!)}");
    if (appUser != null) {
      final user = AppUser.fromJson(appUser as Map<Object?, dynamic>);

      //Provide user for all widgets
      if (!GetIt.I.isRegistered<AppUser>()) {
        GetIt.I.registerSingleton<AppUser>(user, signalsReady: true);
      }
      return user;
    }
    return null;
  }

  Stream<AppUser?> get user {
    return FirebaseAuth.instance.authStateChanges().asyncMap(_userFromFirebase);
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final appUser =
            await dbService.read("$reference/${escapeEmail(googleUser.email)}");
        if (appUser == null) {
          await dbService
              .create("$reference/${escapeEmail(googleUser.email)}", data: {
            'displayName': googleUser.displayName,
            'email': googleUser.email,
            'photoUrl': googleUser.photoUrl,
            "bookmarks": [0]
          });
        }
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (error) {
      debugPrint(error.toString());
    }
    return null;
  }

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();
}
