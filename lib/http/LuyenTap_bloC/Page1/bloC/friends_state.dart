import 'package:equatable/equatable.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/model/friend.dart';

// Trạng thái cơ sở của ứng dụng khi làm việc với danh sách bạn bè
abstract class FriendsState extends Equatable {
  const FriendsState();

  @override
  List<Object> get props => [];
}

// Trạng thái khởi tạo của ứng dụng
class FriendsInitial extends FriendsState {}

// Trạng thái khi danh sách bạn bè đã được tải
class FriendsLoaded extends FriendsState {
  final List<Friend> friends;

  const FriendsLoaded(this.friends);

  @override
  List<Object> get props => [friends];
}

// Trạng thái khi chi tiết của một bạn bè được yêu cầu
class FriendDetail extends FriendsState {
  final Friend friend;

  const FriendDetail(this.friend);

  @override
  List<Object> get props => [friend];
}
