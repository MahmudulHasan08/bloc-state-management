part of 'counter_bloc.dart';

class CounterState {
  late final int count;
  CounterState({required this.count});
}

class CounterInitial extends CounterState {
  CounterInitial() : super(count: 0);
}
