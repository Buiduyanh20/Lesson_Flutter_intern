import 'package:flutter/material.dart';

class Animationwidget extends StatefulWidget {
  const Animationwidget({super.key});

  @override
  State<Animationwidget> createState() => _AnimationwidgetState();
}

class _AnimationwidgetState extends State<Animationwidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller; // Điều khiển animation
  late Animation<double> _animation; // Animation độ mờ

  @override
  void initState() {
    super.initState();
    // Tạo AnimationController với thời gian chạy là 2 giây
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // Tạo animation độ mờ với đường cong easeIn
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    // Bắt đầu animation
    _controller.forward();
  }

  @override
  void dispose() {
    // Hủy AnimationController để giải phóng tài nguyên
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      // Sử dụng animation độ mờ
      opacity: _animation,
      child: FlutterLogo(size: 100),
    );
  }
}
