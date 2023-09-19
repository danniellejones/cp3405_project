import 'package:flutter/material.dart';

class ColourChange extends StatefulWidget {
  const ColourChange({super.key});

  @override
  State<ColourChange> createState() => _ColourChangeState();
}

class _ColourChangeState extends State<ColourChange> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Colour Change'),
            actions: [
              IconButton(
                  onPressed: () {
                    debugPrint('Logout pressed!');
                  },
                  icon: const Icon(Icons.logout)),
              IconButton(
                  onPressed: () {
                    debugPrint('Settings pressed!');
                  },
                  icon: const Icon(Icons.settings))
            ]),
        drawer: Drawer(
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
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Avatar',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.computer), label: 'Board')
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber,
          onTap: _onItemTapped,
        ),
        body: Container());
  }
}
