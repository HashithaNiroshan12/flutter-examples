part of 'login_bloc.dart';

class LoginEvent {
  const LoginEvent();
}

class AuthenticationSubscriptionRequested extends LoginEvent {}

class AuthenticationLogoutPressed extends LoginEvent {}
