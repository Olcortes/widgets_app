import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChanger extends ConsumerWidget {
  const ThemeChanger({super.key});

  static const String name = 'theme_changer';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar Tema en RunTime'),
        actions: [
          IconButton(
            icon: Icon(
                isDarkMode ? Icons.dark_mode_sharp : Icons.light_mode_sharp),
            onPressed: () {
              ref.read(themeNotifierProvider.notifier).toggleDarkMode();
              //ref.read(isDarkProvider.notifier).update((state) => !state);
              //ref.read(isDarkProvider.notifier).update((isDarkMode) => !isDarkMode);
            },
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final int selectedColor = ref.watch(themeNotifierProvider).selectedColor;
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
            title: Text(
              'Este es el color',
              style: TextStyle(color: color),
            ),
            subtitle: Text('${color.value}'),
            activeColor: color,
            value: index,
            groupValue: selectedColor,
            onChanged: ((index) {
              //ref.read(selectedColorProvider.notifier).state = index!;
              ref.read(themeNotifierProvider.notifier).changeColorIndex(index!);
            }));
      },
    );
  }
}
