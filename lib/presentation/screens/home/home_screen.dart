import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';
//import 'package:widgets_app/presentation/screens/buttons/buttons_screen.dart';
//import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final scaffoldKey=GlobalKey<ScaffoldState>();// definimos una variable que guarde el estado del Scaffold
    return Scaffold(
      key: scaffoldKey, //hace referecia al scaffold y su estado
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
      //Enviamos al widget del menu el estado del scaffold.
      drawer:SideMenu(scaffoldKey: scaffoldKey,),//SideNavigationDrawer(children: []),//Menu lateral de izquierda a derecha o enddrawer si es de derecha a izquierda,
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;
  

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: colors.primary),
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      onTap: () {
        context.push( menuItem.link );
      },
    );
  }
}
