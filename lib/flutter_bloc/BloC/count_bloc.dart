// counter_bloc.dart

// CounterBloc để quản lý các sự kiện và trạng thái của counter
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_flutter_intern/flutter_bloc/BloC/count_event.dart';
import 'package:lesson_flutter_intern/flutter_bloc/BloC/count_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  // Khởi tạo với trạng thái ban đầu
  CounterBloc() : super(CounterState.initial()) {
    on<Increment>((event, emit) {
      emit(state.copyWith(value: state.value + 1));
    });
    on<Decrement>((event, emit) {
      emit(state.copyWith(value: state.value - 1));
    });
  }
}
