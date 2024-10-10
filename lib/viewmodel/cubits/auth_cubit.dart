import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repositories/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final User user;
  AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {}

class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
}

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;

  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> signIn(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepository.signInWithEmailAndPassword(email, password);
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthError('User not found'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> register(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepository.registerWithEmailAndPassword(email, password);
      if (user != null) {
        emit(AuthAuthenticated(user));
      } else {
        emit(AuthError('Registration failed'));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void signOut() async {
    await authRepository.signOut();
    emit(AuthUnauthenticated());
  }
}
