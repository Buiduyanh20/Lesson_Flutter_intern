import 'package:flutter/material.dart';

class Widgetrouter1 extends StatelessWidget {
  final VoidCallback onNavigate;

  const Widgetrouter1({required this.onNavigate, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 1'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: onNavigate,
          child: const Text('Go to Screen 2'),
        ),
      ),
    );
  }
}
