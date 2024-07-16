import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/http/LuyenTap1/model/imageDa.dart';
import 'package:lesson_flutter_intern/http/LuyenTap1/network/network_request.dart';

import '../../LuyenTap2/network/network_request.dart';

class Widgethttp extends StatefulWidget {
  const Widgethttp({super.key});

  @override
  State<Widgethttp> createState() => _WidgethttpState();
}

class _WidgethttpState extends State<Widgethttp> {
  List<ImageDA> PostIMG = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetworkRequest2.fetchPosts().then((dataFromSever) {
      setState(() {
        PostIMG = dataFromSever;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Request'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 4,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('${PostIMG[index].id}'),
                          Text('${PostIMG[index].thumbnailUrl}'),
                        ],
                      ),
                    ),
                  );
                },
                childCount: PostIMG.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
