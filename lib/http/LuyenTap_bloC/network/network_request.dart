import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/model/friend.dart';
import 'package:http/http.dart' as http;

class NetworkRequest12 {
  static const String url = 'https://reqres.in/api/users?page=2';

  // Phân tích JSON thành danh sách đối tượng Friend
  static List<Friend> parseFriends(String responseBody) {
    // Phân tích JSON trả về thành một Map và lấy danh sách từ khóa 'data'
    final parsed = json.decode(responseBody) as Map<String, dynamic>;
    final list = parsed['data'] as List<dynamic>;
    return list.map((json) => Friend.fromJson(json)).toList();
  }

  // Hàm bất đồng bộ để lấy danh sách bạn bè từ API
  static Future<List<Friend>> fetchFriends() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      // Nếu yêu cầu thành công, phân tích và trả về danh sách bạn bè
      return compute(parseFriends, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Failed to load friends');
    }
  }
}
