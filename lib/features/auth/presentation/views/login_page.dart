import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/auth/presentation/viewmodels/auth_viewmodel.dart';
import 'package:riverpod_app/features/auth/presentation/widgets/google_signin_button.dart';
import '../../../../providers/auth_providers.dart';
// import '../../viewmodels/auth_viewmodel.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  void initState() {
    super.initState();

    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (next is AuthSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Welcome ${next.user.displayName}")),
        );
      }

      if (next is AuthError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.message)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    // Listen for success or error

    return Scaffold(
      body: Center(
        child:
            kIsWeb
                ? GoogleSignInButton()
                : ElevatedButton.icon(
                  icon: Image.asset('assets/googlesignin.png', height: 24),
                  label: const Text("Sign in with Google"),
                  onPressed: () {
                    ref.read(authViewModelProvider.notifier).signInWithGoogle();
                  },
                ),
      ),
    );
  }
}
