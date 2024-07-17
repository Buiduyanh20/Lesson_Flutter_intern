import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/http/LuyenTap_bloC/Page1/Widget_page.dart';

class Detailscreen extends StatelessWidget {
  const Detailscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const WidgetPageLT(),
              ),
            );
          },
          child: Text('Back'),
        ),
      ),
    );
  }
}
