import 'package:bloc/bloc.dart';
import 'package:version_3_22_8/core/domain/model/user.dart';
import 'package:version_3_22_8/core/repository/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late final AuthRepsotory authRepository;
  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoingRequested>(_onLoginRequested);
    on<LogoutRequested>(_onLogoutReqested);
  }

  Future<void> _onLoginRequested(
      LoingRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    try {
      final user = await authRepository.login(event.email, event.password);
      emit(AuthAuthenticated(user: user));
    } catch (e) {
      emit(AuthError(message: "Login failed:${e.toString()}"));
    }
  }

  Future<void> _onLogoutReqested(
      LogoutRequested event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(AuthLoggedOut());
  }
}
