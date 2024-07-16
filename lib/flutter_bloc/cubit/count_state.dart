part of 'count_cubit.dart';

class CountState extends Equatable {
  final int value; // Biến lưu trữ giá trị của state
  const CountState({required this.value}); // Constructor
  factory CountState.initial() =>
      const CountState(value: 0); //Hàm khởi tạo giá trị ban đầu của state
  CountState copyWith({int? value}) {
    return CountState(value: value ?? this.value);
  } // Hàm copy state để thay đổi giá trị

  List<Object> get props => [value]; // Hàm so sánh giá trị của 2 state
}
