import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_app/repository/auth_repository.dart';

class Login extends ConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final GoogleSignIn =
    void signinwithgoogle(WidgetRef ref) {
      ref.read(authRepositoryProvider).signinwithgoogle();
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              label: Text("Sign in with Google"),
              onPressed: () =>signinwithgoogle(ref),
              
              icon: Image.asset('assets/googlesignin.png'),
            ),
          ],
        ),
      ),
    );
  }
}
