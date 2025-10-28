part of 'login_bloc.dart';

class LoginState extends Equatable {
  final AuthenticationStatus status;
  final User user;

  const LoginState._(
      {this.status = AuthenticationStatus.unknown, this.user = User.empty});

  const LoginState.unknown() : this._();

  const LoginState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const LoginState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
