part of 'counter_cubit.dart';

sealed class CounterState extends Equatable {
  const CounterState();

  @override
  List<Object> get props => [];
}

final class CounterLoading extends CounterState {}
final class CounterAddNumberState extends CounterState {
  final int number;

  const CounterAddNumberState({required this.number});
  @override

  List<Object> get props => [number];
}