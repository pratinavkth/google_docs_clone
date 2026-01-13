import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_app/features/auth/data/repositories/auth_repository.dart';

abstract class AuthState{}

class AuthInitial extends AuthState{}
class AuthLoading extends AuthState{}

class AuthSuccess extends AuthState{
  final GoogleSignInAccount user;
  AuthSuccess(this.user);
}

class AuthError extends AuthState{
  final String message;
  AuthError(this.message);
}

class AuthViewmodel extends StateNotifier<AuthState> {
  final AuthRepository repository;

  AuthViewmodel(this.repository):super(AuthInitial());

  Future<void> signInWithGoogle()async{
    // if(kIsWeb)return;
    try {
      state = AuthLoading();
      final user= await repository.signinwithgoogle();
      if(user!=null){
        state = AuthSuccess(user);
      }else{
        state = AuthInitial();
      }
    } catch (e) {
      state = AuthError(e.toString());
      
    }
  }
  Future<void> signOut()async{
    await repository.signOut();
    state =AuthInitial();
  }
}