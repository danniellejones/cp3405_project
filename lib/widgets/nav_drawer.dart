import 'package:flutter/material.dart';

enum SampleItem { logout }

class DrawerNavigationWidget extends StatefulWidget {
  final String emailTitle;
  final String email;

  const DrawerNavigationWidget({
    super.key,
    this.emailTitle = 'Email',
    this.email = 'your_email@example.com',
  });

  @override
  State<DrawerNavigationWidget> createState() => _DrawerNavigationWidgetState();
}

class _DrawerNavigationWidgetState extends State<DrawerNavigationWidget> {
  Widget _buildDrawerItem(icon, name, context, routeName) {
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Column(children: [
              const Icon(Icons.person_2),
              Text(
                widget.emailTitle,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
              Text(
                widget.email,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ]),
          ),
          _buildDrawerItem(Icons.home, 'Dashboard', context, '/teacherLanding'),
          _buildDrawerItem(Icons.class_, 'Class View', context, '/classView'),
          _buildDrawerItem(
              Icons.map, 'Quest Planner', context, '/questPlanner'),
          _buildDrawerItem(Icons.graphic_eq, 'Metrics', context, '/metrics'),
          _buildDrawerItem(Icons.logout, 'Logout', context, '/'),
        ],
      ),
    );
  }
}
