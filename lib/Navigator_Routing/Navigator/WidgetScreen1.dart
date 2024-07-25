import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/Navigator_Routing/Navigator/WidgetScreen2.dart';

class Widgetscreen1 extends StatelessWidget {
  const Widgetscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen 1'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Widgetscreen2()));
            },
            child: const Text('Screen 2'),
          ),
        ));
  }
}

/*
  Đẩy lên 1 trang mới vào stack
  Navigator.push(context,MaterialPageRoute(builder: (context) => NewScreen()),);

  Lấy một trang ra khỏi stack (quay lại trang trước)
 Navigator.pop(context);

  Đẩy lên 1 trang mới vào stack và giữ nguyên các trang cũ
  Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => NewScreen()),);

  Đẩy lên 1 trang mới vào stack và xóa hết các trang cũ
  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) => NewScreen()),(route) => false);

  Đẩy lên 1 trang mới vào stack và xóa hết các trang cũ
  Navigator.pushNamedAndRemoveUntil(context, '/screen2', (route) => false);
*/
