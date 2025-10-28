import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:version_3_22_8/features/login/new_login/bloc/login_bloc.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(
                const SnackBar(content: Text('Authentication Failure')),
              );
          }
        },
        child: Align(
          alignment: const Alignment(0, -1 / 3),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              _UsernameInput(),
              Padding(padding: EdgeInsets.all(12)),
              _PasswordInput(),
              Padding(padding: EdgeInsets.all(12)),
              _LoginButton(),
            ],
          ),
        ));
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayError =
        context.select((LoginBloc bloc) => bloc.state.username.displayError);

    return TextField(
      key: const Key('loginForm_usernameInput_textField'),
      onChanged: (username) =>
          context.read<LoginBloc>().add(LoginUsernameChanged(username)),
      decoration: InputDecoration(
        labelText: 'username',
        errorText: displayError != null ? 'invalid username' : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.password.displayError,
    );
    return TextField(
      key: const Key('loginForm_passwordInput_textfield'),
      onChanged: (password) {
        context.read<LoginBloc>().add(LoginPasswordChanged(password));
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'password',
        errorText: displayError != null ? 'invalid password' : null,
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isInProgressOrSuccess = context.select(
      (LoginBloc bloc) => bloc.state.status.isInProgressOrSuccess,
    );

    if (isInProgressOrSuccess) {
      return const CircularProgressIndicator();
    }
    final isvalid = context.select((LoginBloc bloc) => bloc.state.isValid);
    return ElevatedButton(
        key: const Key('loginForm_login_raisedButton'),
        onPressed: isvalid
            ? () => context.read<LoginBloc>().add(const LoginSubmitted())
            : null,
        child: const Text('Login'));
  }
}
