import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'count_state.dart';

class CountCubit extends Cubit<CountState> {
  CountCubit() : super(CountState.initial());

  void increment() {
    // hàm tăng giá trị của state lên 1
    emit(state.copyWith(value: state.value + 1));
  }

  void decrement() {
    // hàm giảm giá trị của state lên 1
    emit(state.copyWith(value: state.value - 1));
  }
}
