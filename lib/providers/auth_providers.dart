import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_app/features/auth/data/repositories/auth_repository.dart';
import 'package:riverpod_app/features/auth/presentation/viewmodels/auth_viewmodel.dart';
// ?import 'package:riverpod_app/repository/auth_repository.dart';

final googleSignInProvider = Provider<GoogleSignIn>((ref) {
  return GoogleSignIn.instance;
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(googleSignIn: ref.read(googleSignInProvider));
});

final authViewModelProvider = StateNotifierProvider<AuthViewmodel, AuthState>((ref){
  return AuthViewmodel(
    ref.read(authRepositoryProvider),
  );
});