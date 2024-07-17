import 'package:bloc/bloc.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/Page1/bloC/friends_event.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/Page1/bloC/friends_state.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/network/network_request.dart';

// Bloc để quản lý trạng thái và sự kiện của danh sách bạn bè
class FriendsBloc extends Bloc<FriendsEvent, FriendsState> {
  FriendsBloc() : super(FriendsInitial()) {
    // Xử lý sự kiện ViewDetail
    on<ViewDetail>((event, emit) {
      print('ok'); // Log ra chữ "ok" khi sự kiện được kích hoạt
      emit(FriendDetail(event.friend));
    });

    // Tải danh sách bạn bè khi khởi tạo Bloc
    _loadFriends();
  }

  // Hàm tải danh sách bạn bè từ API
  void _loadFriends() async {
    final friends = await NetworkRequest12.fetchFriends();
    emit(FriendsLoaded(friends));
  }
}
