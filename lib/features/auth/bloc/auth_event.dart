part of 'auth_bloc.dart';

abstract class AuthEvent {}

class LoingRequested extends AuthEvent {
  final String email;
  final String password;

  LoingRequested({required this.email, required this.password});
}

class LogoutRequested extends AuthEvent {}
