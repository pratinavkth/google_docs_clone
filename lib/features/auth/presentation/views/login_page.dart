import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/features/auth/presentation/viewmodels/auth_viewmodel.dart';
import '../../../../providers/auth_providers.dart';
// import '../../viewmodels/auth_viewmodel.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);

    // Listen for success or error
    ref.listen<AuthState>(authViewModelProvider, (previous, next) {
      if (next is AuthSuccess) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Welcome ${next.user.displayName}"),
          ),
        );
      }

      if (next is AuthError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(next.message),
          ),
        );
      }
    });

    return Scaffold(
      body: Center(
        child: authState is AuthLoading
            ? const CircularProgressIndicator()
            : ElevatedButton.icon(
                icon: Image.asset(
                  'assets/googlesignin.png',
                  height: 24,
                ),
                label: const Text("Sign in with Google"),
                onPressed: () {
                  ref
                      .read(authViewModelProvider.notifier)
                      .signInWithGoogle();
                },
              ),
      ),
    );
  }
}
