import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  // Google sign-in
  Future<void> signInWithGoogle() async {
    try {
      // Start the sign-in process
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        clientId: "759707120454-1gl8v2jcu37j7kah2foailvdnagujr63.apps..googleusercontent.com", // Use your Web Client ID
        scopes: ['email'],
      );

      // Try to sign in silently (if the user has signed in previously)
      GoogleSignInAccount? gUser = await _googleSignIn.signInSilently();
      
      // If no user is signed in silently, perform interactive sign-in
      if (gUser == null) {
        gUser = await _googleSignIn.signIn();
      }

      // Obtain authentication details from the Google account
      final GoogleSignInAuthentication gAuth = await gUser!.authentication;

      // Create a credential using the Google sign-in token
      final credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );

      // Sign in with the credential
      await FirebaseAuth.instance.signInWithCredential(credential);

      log("User signed in: ${gUser.email}");
    } on Exception catch (e) {
      log("Exception: $e");
    }
  }
}
