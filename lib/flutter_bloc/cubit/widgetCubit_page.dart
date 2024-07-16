import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lesson_flutter_intern/flutter_bloc/cubit/count_cubit.dart';

class WidgetcubitPage extends StatelessWidget {
  const WidgetcubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    CountCubit countCubit = CountCubit();

    return BlocProvider(
        create: (context) => countCubit,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('WidgetCubit'),
          ),
          body: Center(child: BlocBuilder<CountCubit, CountState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.value.toString(),
                    style: TextStyle(fontSize: 50),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          context.read<CountCubit>().increment();
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        onPressed: () {
                          context.read<CountCubit>().decrement();
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
          )),
        ));
  }
}
