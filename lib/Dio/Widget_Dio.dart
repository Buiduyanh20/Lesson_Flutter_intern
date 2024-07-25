import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/Dio/API/api_service.dart';
import 'package:lesson_flutter_intern/Dio/Model/user.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final ApiService _apiService = ApiService();
  List<User> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  void _fetchUsers() async {
    var users = await _apiService.fetchUsers();
    setState(() {
      _users = users;
      _isLoading = false;
    });
  }

  void _createUser() async {
    User newUser = User(id: 0, name: 'New User', email: 'newuser@example.com');
    User? createdUser = await _apiService.createUser(newUser);
    if (createdUser != null) {
      setState(() {
        _users.add(createdUser);
      });
    }
  }

  void _updateUser(int id) async {
    User updatedUser =
        User(id: id, name: 'Updated User', email: 'updateduser@example.com');
    User? user = await _apiService.updateUser(id, updatedUser);
    if (user != null) {
      setState(() {
        int index = _users.indexWhere((u) => u.id == id);
        if (index != -1) {
          _users[index] = user;
        }
      });
    }
  }

  void _deleteUser(int id) async {
    bool success = await _apiService.deleteUser(id);
    if (success) {
      setState(() {
        _users.removeWhere((u) => u.id == id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _createUser, // Thêm người dùng mới
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_users[index].name),
                  subtitle: Text(_users[index].email),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _updateUser(
                            _users[index].id), // Cập nhật người dùng
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () =>
                            _deleteUser(_users[index].id), // Xóa người dùng
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
