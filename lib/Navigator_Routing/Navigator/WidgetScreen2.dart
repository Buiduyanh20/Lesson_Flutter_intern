import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/Navigator_Routing/Navigator/WidgetScreen1.dart';

class Widgetscreen2 extends StatelessWidget {
  const Widgetscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Screen 2'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => Widgetscreen1()));
            },
            child: const Text('Back'),
          ),
        ));
  }
}
