import 'package:equatable/equatable.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/model/friend.dart';

// Lớp cơ sở cho các sự kiện của FriendsBloc
abstract class FriendsEvent extends Equatable {
  const FriendsEvent();

  @override
  List<Object> get props => [];
}

// Sự kiện khi người dùng click vào một item để xem chi tiết
class ViewDetail extends FriendsEvent {
  final Friend friend;

  const ViewDetail(this.friend);

  @override
  List<Object> get props => [friend];
}
