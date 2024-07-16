import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lesson_flutter_intern/http/LuyenTap2/models/post.dart';

class NetworkRequest {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  static List<Post> parsePosts(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<Post> posts = list.map((model) => Post.fromJson(model)).toList();
    return posts;
  }

  static Future<List<Post>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parsePosts, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
