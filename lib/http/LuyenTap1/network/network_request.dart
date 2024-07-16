import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lesson_flutter_intern/http/LuyenTap1/model/imageDa.dart';

class NetworkRequest2 {
  static const String url = 'https://jsonplaceholder.typicode.com/photos';

  static List<ImageDA> parseImage(String responseBody) {
    var list = json.decode(responseBody) as List<dynamic>;
    List<ImageDA> imageDas =
        list.map((model) => ImageDA.fromJson(model)).toList();
    return imageDas;
  }

  static Future<List<ImageDA>> fetchPosts({int page = 1}) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return compute(parseImage, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Failed to load ảnh');
    }
  }
}
