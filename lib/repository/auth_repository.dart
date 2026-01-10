import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

// final authRepositoryprovider  = Provider((ref)=>AuthRepository(googleSignIn: GoogleSignIn(),));
final authRepositoryProvider = Provider(
  (ref) => AuthRepository(googleSignIn: GoogleSignIn.instance),
);

class AuthRepository {
  final GoogleSignIn _googleSignIn;

  AuthRepository({required GoogleSignIn googleSignIn})
    : _googleSignIn = googleSignIn;

  void signinwithgoogle() async {
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
    } catch (e) {
      print(e);
    }
  }
}
