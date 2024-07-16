// widget_bloc_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_flutter_intern/flutter_bloc/BloC/count_bloc.dart';
import 'package:lesson_flutter_intern/flutter_bloc/BloC/count_event.dart';
import 'package:lesson_flutter_intern/flutter_bloc/BloC/count_state.dart';

// WidgetBlocPage để hiển thị giao diện người dùng
class WidgetBlocPage extends StatelessWidget {
  const WidgetBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Cung cấp CounterBloc cho cây widget
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WidgetBloc'),
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, CounterState>(
            // BlocBuilder lắng nghe các thay đổi trạng thái của CounterBloc
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hiển thị giá trị hiện tại của counter
                  Text(
                    state.value.toString(),
                    style: const TextStyle(fontSize: 50),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Nút tăng giá trị counter
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          // Thêm sự kiện Increment vào CounterBloc
                          context.read<CounterBloc>().add(Increment());
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 50),
                      // Nút giảm giá trị counter
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          // Thêm sự kiện Decrement vào CounterBloc
                          context.read<CounterBloc>().add(Decrement());
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
