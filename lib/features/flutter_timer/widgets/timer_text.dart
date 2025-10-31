import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_3_22_8/features/flutter_timer/bloc/timer_bloc.dart';

class TimerText extends StatelessWidget {
  const TimerText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final miuntestr = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final secondstr = (duration % 60).floor().toString().padLeft(2,'0');
    return Text(
      '$miuntestr:$secondstr',
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
