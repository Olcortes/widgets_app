import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/themes/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final selectedColor = ref.watch(selectedColorProvider);
    final isDarkMode = ref.watch(isDarkProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
              selectedColor: selectedColor,
              isDarkMode: isDarkMode).getTheme(),
      // Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //  ),
      //),
    );
  }
}
