import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_3_22_8/features/login/bloc/login_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [_LogoutButton(), _UserId()],
      ),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context.read<LoginBloc>().add(AuthenticationLogoutPressed());
        },
        child: const Text('Logout'));
  }
}

class _UserId extends StatelessWidget {
  const _UserId({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userId = context.select((LoginBloc bloc) => bloc.state.user.id);
    return Text('User ID: $userId');
  }
}
