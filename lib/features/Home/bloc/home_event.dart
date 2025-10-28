part of 'home_bloc.dart';

class HomeEvent {}

class CounterIncrementPressed extends HomeEvent {
  final int counter;

  CounterIncrementPressed({required this.counter});
}

class CounterDecrementPressed extends HomeEvent {
  final int counter;

  CounterDecrementPressed({required this.counter});
}
