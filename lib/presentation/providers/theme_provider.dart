import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

//Listado de colofres inmutable para que cualquier provider pueda usarlo...
//Es para usar el listado de colores que tenemos en el app_theme.dart
// Provider es para Valores inmutables
final colorListProvider = Provider((ref) => colorList);

//Provider para Dark o no
//StateProvider es para mantener algunos valores
final isDarkProvider = StateProvider((ref) => false);

//Provider para manejar el color seleccionado
final selectedColorProvider = StateProvider((ref) => 0);

//Una instancia del tipo AppTheme como objeto personalizado
//Para manetener un estado mucho mas elaborado
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Controlles para el Theme
class ThemeNotifier extends StateNotifier<AppTheme> {
// Se usa para manener un estado
  ThemeNotifier() : super(AppTheme()); //Estado = un nuevo AppTheme
  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
