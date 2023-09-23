import 'package:flutter/material.dart';

enum SampleItem { logout }

class WebNavigationWidget extends StatefulWidget {
  WebNavigationWidget({super.key});

  @override
  State<WebNavigationWidget> createState() => _WebNavigationWidgetState();
}

class _WebNavigationWidgetState extends State<WebNavigationWidget> {
  int _selectedIndex = 0;
  SampleItem? selectedMenu;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _handleLogout() {
    debugPrint('Logout');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('Web Navigation'),
            actions: [
              IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    debugPrint('Settings pressed!');
                    showMenu<SampleItem>(
                      context: context,
                      position: RelativeRect.fromLTRB(0, kToolbarHeight, 0, 0),
                      items: [
                        PopupMenuItem<SampleItem>(
                            child: Text('Logout'), value: SampleItem.logout),
                      ],
                    ).then((value) {
                      if (value != null) {
                        setState(() {
                          selectedMenu = value;
                          if (value == SampleItem.logout) {
                            _handleLogout();
                          }
                        });
                      }
                    });
                  })
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
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(color: Colors.red, Icons.heart_broken),
                Icon(Icons.heart_broken),
                Icon(Icons.heart_broken),
                Icon(Icons.heart_broken),
                Icon(Icons.heart_broken),
              ]),
              Text(
                'Greyscale Meter',
                style: TextStyle(fontSize: 24),
              ),
              Text('Your phone must be idle to restore health!'),
            ],
          ),
        ));
  }
}
