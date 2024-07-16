import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/http/LuyenTap2/models/post.dart';
import 'package:lesson_flutter_intern/http/LuyenTap2/network/network_request.dart';

class Httpwidget extends StatefulWidget {
  const Httpwidget({super.key});

  @override
  State<Httpwidget> createState() => _HttpwidgetState();
}

class _HttpwidgetState extends State<Httpwidget> {
  List<Post> postData = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkRequest.fetchPosts().then((dataFromSever) {
      setState(() {
        postData = dataFromSever;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Http Request'),
        ),
        body: Column(
          children: [
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
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
