import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_3_22_8/features/login/bloc/login_bloc.dart';
import 'package:version_3_22_8/features/login/pages/home_page.dart';
import 'package:version_3_22_8/features/login/pages/login_page.dart';
import 'package:version_3_22_8/features/login/repository/auhthenctication_repository.dart';
import 'package:version_3_22_8/features/splash/splash_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              switch (state.status) {
                case AuthenticationStatus.authenticated:
                  _navigator.pushAndRemoveUntil<void>(
                      HomePage.route(), (route) => false);
                  break;

                case AuthenticationStatus.unauthenticated:
                  _navigator.pushAndRemoveUntil(
                      LoginPage.route(), (route) => false);
                  break;
                case AuthenticationStatus.unknown:
                  break;
              }
            },
            child: child);
      },
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
