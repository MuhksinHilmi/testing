import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterLoading());

  void addNumber(int num) {
    emit(CounterAddNumberState(number: num));
  }
}
