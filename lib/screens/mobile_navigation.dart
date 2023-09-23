import 'package:flutter/material.dart';

class MobileNavigation extends StatefulWidget {
  const MobileNavigation({super.key});

  @override
  State<MobileNavigation> createState() => _MobileNavigationState();
}

class _MobileNavigationState extends State<MobileNavigation> {
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
            backgroundColor: Colors.blue,
            title: const Text('Mobile Navigation'),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Content Header',
                style: TextStyle(fontSize: 24),
              ),
              // Add widgets here...
            ],
          ),
        ));
  }
}
