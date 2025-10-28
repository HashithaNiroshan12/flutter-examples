import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_3_22_8/features/bloc/counter/bloc/counter_bloc.dart';
import 'package:version_3_22_8/features/bloc/counter/bloc/counter_event.dart';
import 'package:version_3_22_8/features/bloc/counter/bloc/counter_state.dart';

class CounterBlocPage extends StatefulWidget {
  const CounterBlocPage({Key? key}) : super(key: key);

  @override
  State<CounterBlocPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterBlocPage> {
  late CounterBloc counterBloc;

  @override
  void initState() {
    super.initState();
    counterBloc = CounterBloc();
  }

  @override
  void dispose() {
    counterBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: counterBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Counter App"),
        ),
        body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
          return Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Counter Value:'),
              Text(
                '${state.value}',
                style: Theme.of(context).textTheme.headline4,
              )
            ]),
          );
        }),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () =>
                  context.read<CounterBloc>().add(IncrementEvent()),
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              onPressed: (() =>
                  context.read<CounterBloc>().add(DecrementEvent())),
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            )
          ],
        ),
      ),
    );
  }
}
