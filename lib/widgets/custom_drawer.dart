import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child: Text("Menu Aplikasi")),
          ListTile(
            leading: Icon(Icons.info),
            title: Text("Info"),
            onTap: () => Navigator.pushReplacementNamed(context, '/info'),
          ),
          ListTile(
            leading: Icon(Icons.explore),
            title: Text("Qibla"),
            onTap: () => Navigator.pushNamed(context, '/qibla'),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("About"),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
        ],
      ),
    );
  }
}
