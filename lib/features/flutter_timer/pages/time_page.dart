import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_3_22_8/features/flutter_timer/bloc/timer_bloc.dart';
import 'package:version_3_22_8/features/flutter_timer/pages/ticker.dart';
import 'package:version_3_22_8/features/flutter_timer/pages/timer_view.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const Ticker()),
      child: const TimerView(),
    );
  }
}
