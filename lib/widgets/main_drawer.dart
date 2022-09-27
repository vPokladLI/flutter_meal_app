import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);
  Widget buildListTile({String title, IconData icon, Function onTap}) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 24,
            fontFamily: 'RobotoCondesed',
            fontWeight: FontWeight.bold),
      ),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Drawer(
      child: Column(children: [
        Container(
          padding: EdgeInsets.only(
              top: mediaQuery.padding.top + 20,
              bottom: 20,
              left: 20,
              right: 20),
          width: double.infinity,
          alignment: Alignment.center,
          color: Theme.of(context).colorScheme.secondary,
          child: Text(
            'Cooking time!',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
        SizedBox(height: 30),
        buildListTile(
            icon: Icons.restaurant_menu, title: 'Meals', onTap: () {}),
        buildListTile(
            icon: Icons.filter_alt_outlined, title: 'Filters', onTap: () {}),
      ]),
    );
  }
}
