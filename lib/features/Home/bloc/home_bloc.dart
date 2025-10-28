import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, CounterState> {
  HomeBloc() : super(CounterState(counter: 0)) {
    on<CounterIncrementPressed>((event, emit) {
      emit(CounterState(counter: event.counter + 1));
    });

    on<CounterDecrementPressed>((event, emit) {
      emit(CounterState(counter: event.counter - 1));
    });
  }
}
