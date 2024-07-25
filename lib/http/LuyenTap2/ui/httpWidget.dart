import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/http/LuyenTap2/models/post.dart';
import 'package:lesson_flutter_intern/http/LuyenTap2/network/network_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class Httpwidget extends StatefulWidget {
  const Httpwidget({super.key});

  @override
  State<Httpwidget> createState() => _HttpwidgetState();
}

class _HttpwidgetState extends State<Httpwidget> {
  List<Post> postData = []; // Danh sách các bài viết sẽ được hiển thị
  final TextEditingController _titleController =
      TextEditingController(); // Bộ điều khiển cho trường nhập tiêu đề
  final TextEditingController _bodyController =
      TextEditingController(); // Bộ điều khiển cho trường nhập nội dung

  @override
  void initState() {
    super.initState();
    _loadData(); // Tải dữ liệu khi widget được khởi tạo
  }

  void _loadData() async {
    final posts =
        await _getSavedPosts(); // Lấy dữ liệu bài viết đã lưu từ SharedPreferences
    if (posts.isNotEmpty) {
      setState(() {
        postData = posts; // Nếu có dữ liệu đã lưu, cập nhật danh sách bài viết
      });
    } else {
      _fetchPosts(); // Nếu không có dữ liệu đã lưu, lấy dữ liệu từ server
    }
  }

  void _fetchPosts() async {
    try {
      final dataFromServer = await NetworkRequest
          .fetchPosts(); // Gửi yêu cầu lấy danh sách bài viết từ server
      setState(() {
        postData =
            dataFromServer; // Cập nhật danh sách bài viết với dữ liệu từ server
      });
      _savePosts(dataFromServer); // Lưu dữ liệu bài viết vào SharedPreferences
    } catch (e) {
      print(e); // Nếu có lỗi xảy ra, in ra lỗi
    }
  }

  void _addPost() async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty)
      return; // Kiểm tra trường nhập liệu không rỗng

    final newPost = Post(
      userId: 1,
      title: _titleController.text,
      body: _bodyController.text,
    );

    try {
      final addedPost = await NetworkRequest.addPost(
          newPost); // Gửi yêu cầu thêm bài viết mới lên server
      setState(() {
        postData.add(addedPost); // Cập nhật danh sách bài viết với bài viết mới
      });
      _savePosts(postData); // Lưu danh sách bài viết vào SharedPreferences
      _titleController
          .clear(); // Xóa dữ liệu trong trường nhập liệu sau khi thêm thành công
      _bodyController.clear();
    } catch (e) {
      print(e); // Nếu có lỗi xảy ra, in ra lỗi
    }
  }

  void _updatePost(int id) async {
    if (_titleController.text.isEmpty || _bodyController.text.isEmpty)
      return; // Kiểm tra trường nhập liệu không rỗng

    final updatedPost = Post(
      userId: 1,
      title: _titleController.text,
      body: _bodyController.text,
    );

    try {
      final updated = await NetworkRequest.updatePost(
          id, updatedPost); // Gửi yêu cầu cập nhật bài viết lên server
      setState(() {
        final index = postData.indexWhere((post) =>
            post.id == id); // Tìm bài viết cần cập nhật trong danh sách
        if (index != -1) {
          postData[index] = updated; // Cập nhật bài viết trong danh sách
        }
      });
      _savePosts(postData); // Lưu danh sách bài viết vào SharedPreferences
      _titleController
          .clear(); // Xóa dữ liệu trong trường nhập liệu sau khi cập nhật thành công
      _bodyController.clear();
    } catch (e) {
      print(e); // Nếu có lỗi xảy ra, in ra lỗi
    }
  }

  void _deletePost(int id) async {
    try {
      await NetworkRequest.deletePost(
          id); // Gửi yêu cầu xóa bài viết lên server
      setState(() {
        postData.removeWhere(
            (post) => post.id == id); // Xóa bài viết khỏi danh sách
      });
      _savePosts(postData); // Lưu danh sách bài viết vào SharedPreferences
    } catch (e) {
      print(e); // Nếu có lỗi xảy ra, in ra lỗi
    }
  }

  Future<void> _savePosts(List<Post> posts) async {
    final prefs = await SharedPreferences
        .getInstance(); // Lấy instance của SharedPreferences
    List<String> postStrings = posts
        .map((post) => jsonEncode(post.toJson()))
        .toList(); // Chuyển đổi danh sách bài viết thành danh sách chuỗi JSON
    await prefs.setStringList(
        'posts', postStrings); // Lưu danh sách chuỗi JSON vào SharedPreferences
  }

  Future<List<Post>> _getSavedPosts() async {
    final prefs = await SharedPreferences
        .getInstance(); // Lấy instance của SharedPreferences
    List<String>? postStrings = prefs.getStringList(
        'posts'); // Lấy danh sách chuỗi JSON từ SharedPreferences
    if (postStrings != null) {
      return postStrings
          .map((post) => Post.fromJson(jsonDecode(post)))
          .toList(); // Chuyển đổi danh sách chuỗi JSON thành danh sách bài viết
    }
    return []; // Trả về danh sách rỗng nếu không có dữ liệu
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Http Request'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Title'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _bodyController,
              decoration: InputDecoration(labelText: 'Body'),
            ),
          ),
          ElevatedButton(
            onPressed: _addPost,
            child: Text('Add Post'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: postData.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${postData[index].id}.${postData[index].title}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('${postData[index].body}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                _titleController.text =
                                    postData[index].title ?? '';
                                _bodyController.text =
                                    postData[index].body ?? '';
                                _updatePost(postData[index].id!);
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                _deletePost(postData[index].id!);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
