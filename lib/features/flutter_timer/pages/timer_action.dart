import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_3_22_8/features/flutter_timer/bloc/timer_bloc.dart';

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        List<Widget> buttons = [];

        if (state is TimerInitial) {
          buttons = [
            FloatingActionButton(
              onPressed: () => context
                  .read<TimerBloc>()
                  .add(TimerStarted(duraion: state.duration)),
              child: const Icon(Icons.play_arrow),
            ),
          ];
        } else if (state is TimerRunInProgress) {
          buttons = [
            FloatingActionButton(
              onPressed: () =>
                  context.read<TimerBloc>().add(const TimerPaused()),
              child: const Icon(Icons.pause),
            ),
            FloatingActionButton(
              onPressed: () =>
                  context.read<TimerBloc>().add(const TimerReset()),
              child: const Icon(Icons.replay),
            ),
          ];
        } else if (state is TimerRunPause) {
          buttons = [
            FloatingActionButton(
              onPressed: () =>
                  context.read<TimerBloc>().add(const TimerResumed()),
              child: const Icon(Icons.play_arrow),
            ),
            FloatingActionButton(
              onPressed: () =>
                  context.read<TimerBloc>().add(const TimerReset()),
              child: const Icon(Icons.replay),
            ),
          ];
        } else if (state is TimerRunComlete) {
          buttons = [
            FloatingActionButton(
              onPressed: () =>
                  context.read<TimerBloc>().add(const TimerReset()),
              child: const Icon(Icons.replay),
            ),
          ];
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: buttons,
        );
      },
    );
  }
}
