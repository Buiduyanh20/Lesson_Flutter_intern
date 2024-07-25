import 'package:flutter/material.dart';
import 'package:lesson_flutter_intern/provider/counter.dart';
import 'package:provider/provider.dart';

class Widgetprovider extends StatefulWidget {
  const Widgetprovider({super.key});

  @override
  State<Widgetprovider> createState() => _WidgetproviderState();
}

class _WidgetproviderState extends State<Widgetprovider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider'),
      ),
      body: Center(child: Consumer<Counter>(
        builder: (context, counter, child) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${counter.count}',
                style: TextStyle(fontSize: 50),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      context.read<Counter>().increment();
                    },
                    child: Text(
                      '+',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<Counter>().decrement();
                    },
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      )),
    );
  }
}
