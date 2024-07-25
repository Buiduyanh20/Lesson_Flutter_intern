import 'package:dio/dio.dart';
import 'package:lesson_flutter_intern/Dio/Model/user.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<User>> fetchUsers() async {
    try {
      Response response =
          await _dio.get('https://jsonplaceholder.typicode.com/users');
      List<User> users =
          (response.data as List).map((user) => User.fromJson(user)).toList();
      return users;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  Future<User?> createUser(User user) async {
    try {
      Response response = await _dio.post(
        'https://jsonplaceholder.typicode.com/users',
        data: user.toJson(),
      );
      return User.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<User?> updateUser(int id, User user) async {
    try {
      Response response = await _dio.put(
        'https://jsonplaceholder.typicode.com/users/$id',
        data: user.toJson(), // Chuyển đổi User thành Map<String, dynamic>
      );
      return User.fromJson(response.data);
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }

  Future<bool> deleteUser(int id) async {
    try {
      await _dio.delete('https://jsonplaceholder.typicode.com/users/$id');
      return true;
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
