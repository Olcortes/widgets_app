import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
//import 'package:go_router/go_router.dart';

class CounterScreen extends ConsumerWidget {
  //se utiliza consumerwidget por estar usando riverpod
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen'),
        actions: [
          IconButton(
            icon: 
                Icon( isDarkMode? Icons.dark_mode_sharp:Icons.light_mode_sharp ),
            onPressed: () {
              ref.read(isDarkProvider.notifier).update((isDarkMode) => !isDarkMode);
            },
          )
        ],
      ),
      body: Center(
          child: Text(
        'Valor: $clickCounter',
        style: Theme.of(context).textTheme.titleLarge,
      )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () {
          ref.read(counterProvider.notifier).state++; //incrementa y hace el cambio al estado
          //contador += contador;
          //context.pop();
        },
      ),
    );
  }
}
