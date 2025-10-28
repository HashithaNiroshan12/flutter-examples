import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:version_3_22_8/features/Home/bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = BlocProvider.of<HomeBloc>(context);

    return BlocBuilder<HomeBloc, CounterState>(
      bloc: homeBloc,
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Flutter BLoC Example'),
              backgroundColor: Colors.blue.shade800,
              foregroundColor: Colors.white,
            ),
            body: Center(
              child: Text(
                'Counter: ${state.counter}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: (() {
                    homeBloc
                        .add(CounterIncrementPressed(counter: state.counter));
                  }),
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: (() {
                    homeBloc
                        .add(CounterDecrementPressed(counter: state.counter));
                  }),
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
