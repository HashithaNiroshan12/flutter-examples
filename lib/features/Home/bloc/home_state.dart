part of 'home_bloc.dart';

class HomeState {}

class HomeInitial extends HomeState {}

class CounterState extends HomeInitial {
  final int counter;

  CounterState({required this.counter});
}
