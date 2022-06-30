import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(CounterState(count: state.count + 1));
    });
    on<DecrementCounterEvent>((event, emit) {
      emit(CounterState(count: state.count - 1));
    });
  }
}
