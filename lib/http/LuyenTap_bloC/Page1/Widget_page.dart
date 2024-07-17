import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/model/friend.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/Page1/bloC/friends_bloc.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/Page1/bloC/friends_event.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/Page1/bloC/friends_state.dart';

import '../Page2/DetailScreen.dart';

class WidgetPageLT extends StatefulWidget {
  const WidgetPageLT({super.key});

  @override
  State<WidgetPageLT> createState() => _WidgetPageLTState();
}

class _WidgetPageLTState extends State<WidgetPageLT> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luyện tập http và Bloc'),
      ),
      body: BlocProvider(
        create: (_) => FriendsBloc(),
        child: BlocBuilder<FriendsBloc, FriendsState>(
          builder: (context, state) {
            if (state is FriendsInitial) {
              return Center(child: CircularProgressIndicator());
            } else if (state is FriendsLoaded) {
              return CustomScrollView(slivers: [
                SliverPadding(
                  padding:
                      EdgeInsets.only(top: 20, left: 20, bottom: 30, right: 20),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3 / 4,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final friend = state.friends[index];
                        return GestureDetector(
                          onTap: () {
                            // Chuyển hướng đến Detailscreen khi người dùng click vào item
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Detailscreen(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            color: index % 2 == 0 ? Colors.orange : Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Hiển thị ảnh từ URL
                                if (friend.image != null)
                                  Image.network(friend.image!,
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.cover),
                                Text('${friend.id}'),
                                Text('${friend.firstName}'),
                                Text('${friend.lastName}'),
                                Text('${friend.email}'),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: state.friends
                          .length, // Sử dụng friends.length để hiển thị số lượng phần tử đúng
                    ),
                  ),
                ),
              ]);
            } else {
              return Center(child: Text('Something went wrong!'));
            }
          },
        ),
      ),
    );
  }
}
