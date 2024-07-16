// counter_event.dart

// Lớp cơ sở trừu tượng cho tất cả các sự kiện
abstract class CounterEvent {}

// Sự kiện tăng giá trị counter
class Increment extends CounterEvent {}

// Sự kiện giảm giá trị counter
class Decrement extends CounterEvent {}
