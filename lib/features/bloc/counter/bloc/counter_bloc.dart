import 'package:bloc/bloc.dart';
import 'package:version_3_22_8/features/bloc/counter/bloc/counter_event.dart';
import 'package:version_3_22_8/features/bloc/counter/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(value: 0));

  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(value: state.value + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(value: state.value - 1);
    }
  }
}
