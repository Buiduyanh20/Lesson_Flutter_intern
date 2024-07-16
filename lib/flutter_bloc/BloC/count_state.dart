// counter_state.dart
import 'package:equatable/equatable.dart';

// Lớp trạng thái cho CounterBloc
class CounterState extends Equatable {
  final int value; // Giá trị hiện tại của counter

  // Constructor cho CounterState
  const CounterState({required this.value});

  // Phương thức khởi tạo trạng thái ban đầu với giá trị 0
  factory CounterState.initial() => const CounterState(value: 0);

  // Phương thức copyWith để tạo ra một đối tượng CounterState mới
  // với giá trị mới hoặc giữ nguyên giá trị hiện tại nếu không có giá trị mới
  CounterState copyWith({int? value}) {
    return CounterState(value: value ?? this.value);
  }

  // Phương thức props để so sánh các đối tượng CounterState
  @override
  List<Object> get props => [value];
}
