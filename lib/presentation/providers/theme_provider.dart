import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/themes/app_theme.dart';

//Listado de colofres inmutable para que cualquier provider pueda usarlo...
//Es para usar el listado de colores que tenemos en el app_theme.dart
final colorListProvider = Provider((ref) => colorList);

//Provider para Dark o no
final isDarkProvider = StateProvider((ref) => false);

//Provider para manejar el color seleccionado
final selectedColorProvider = StateProvider((ref) => 0);
