import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/models.dart';
import '../repository/repositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;
  final UserRepository _userRepository;

  LoginBloc({
    required AuthenticationRepository authenticationRepository,
    required UserRepository userRepository,
  })  : _authenticationRepository = authenticationRepository,
        _userRepository = userRepository,
        super(const LoginState.unknown()) {
    on<AuthenticationSubscriptionRequested>((_onSubscriptionRequested));
    on<AuthenticationLogoutPressed>(_onLogoutPressed);
  }

  Future<void> _onSubscriptionRequested(
    AuthenticationSubscriptionRequested event,
    Emitter<LoginState> emit,
  ) {
    return emit.onEach(_authenticationRepository.status,
        onData: (status) async {
      switch (status) {
        case AuthenticationStatus.unauthenticated:
          return emit(const LoginState.unauthenticated());
        case AuthenticationStatus.authenticated:
          final user = await _tryGetUser();
          return emit(
            user != null
                ? LoginState.authenticated(user)
                : const LoginState.unauthenticated(),
          );
        case AuthenticationStatus.unknown:
          return emit(const LoginState.unknown());
      }
    }, onError: addError);
  }

  void _onLogoutPressed(
    AuthenticationLogoutPressed event,
    Emitter<LoginState> emit,
  ) {
    _authenticationRepository.logout();
  }

  Future<User?> _tryGetUser() async {
    try {
      final user = await _userRepository.getUser();
      return user;
    } catch (_) {
      return null;
    }
  }
}
