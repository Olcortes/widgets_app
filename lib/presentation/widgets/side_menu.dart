import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState>
      scaffoldKey; //recibimos el estado original del scaffold de la app
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex =
      0; //Para saber cual de las opciones esta seleccionada
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top >
        27; //Verificamos si tiene notch en el top y es mayor a 27
    if (Platform.isAndroid) {
      //valida Si es android
      //print('Android $hasNotch ');
    } else {
      //print('IOS $hasNotch '); //valida si es IOS
    }

    return NavigationDrawer(
        selectedIndex: navDrawerIndex, //Indica en donde se para el foco
        onDestinationSelected: (value) {
          //Cambiamos el estado del stateful para que el nuevo value navDrawer sea el nuevo value despues de picar en el
          setState(() {
            navDrawerIndex = value;
          });

          final menuItem = appMenuItems[value];
          context.push(
              menuItem.link); //Finalmente con este navego por las pantallas...
          widget.scaffoldKey.currentState?.closeDrawer(); //Con esto cerramos el menu siempre que regresamos de cualquier otra pantalla ? es para que reciba nulos
        },
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16,
                10), //Si tiene notch mayor a 27 coloca top en 10, si no lo coloca en 20
            child: const Text('main'),
          ),
          ...appMenuItems.sublist(0, 3).map(
                (item) => NavigationDrawerDestination(
                  //.map para recorrer todas las opciones y reconstruiralas dentro del menu
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ), //appMenuItems
          const Padding(
            padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
            child: Divider(),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
            child: Text('Mas Opciones...'),
          ),

          ...appMenuItems.sublist(3).map(
                (item) => NavigationDrawerDestination(
                  //.map para recorrer todas las opciones y reconstruiralas dentro del menu
                  icon: Icon(item.icon),
                  label: Text(item.title),
                ),
              ), //appMenuItems
        ]);
  }
}
