import 'package:flutter/material.dart';

enum SampleItem { logout }

class DrawerNavigationWidget extends StatefulWidget {
  const DrawerNavigationWidget({super.key});

  @override
  State<DrawerNavigationWidget> createState() => _DrawerNavigationWidgetState();
}

class _DrawerNavigationWidgetState extends State<DrawerNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(children: [
              Icon(Icons.person_2),
              Text(
                'Username',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                'Email',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ]),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            leading: Icon(Icons.class_),
            title: Text("Class Overview"),
          ),
          ListTile(
            leading: Icon(Icons.map),
            title: Text("Quest Planner"),
          ),
          ListTile(
            leading: Icon(Icons.graphic_eq),
            title: Text("Metrics"),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }
}
