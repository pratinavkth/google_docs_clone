import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final GoogleSignIn _googleSignIn;

  AuthRepository({required GoogleSignIn googleSignIn})
    : _googleSignIn = googleSignIn;

  Future<GoogleSignInAccount?> signinwithgoogle() async {
    if (kIsWeb) return null;
    try {
      await _googleSignIn.initialize(
        clientId:
            '420187231276-633djugfidni2slhmghed29dordg7tqa.apps.googleusercontent.com',
      );
      final user = await _googleSignIn.authenticate();
      if (user != null) {
        print(user.displayName);
        print(user.email);
      }
      return user;
    } catch (e) {
      print(e);
    }
  }

  Future<void> signOut() async {
    await GoogleSignIn.instance.signOut();
  }
}
