import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Widgetgetx extends StatelessWidget {
  Widgetgetx({super.key});

  // Tạo biến phản ứng count
  var count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetX'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Sử dụng Obx để lắng nghe và cập nhật giao diện khi count thay đổi
            Obx(() => Text(
                  '${count.value}',
                  style: TextStyle(fontSize: 50),
                )),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Tăng giá trị count
                    count++;
                  },
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Giảm giá trị count
                    count--;
                  },
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(GetMaterialApp(home: Widgetgetx()));
}
