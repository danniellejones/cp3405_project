import 'package:flutter/material.dart';

class MobileBottomNavBar extends StatefulWidget {
  const MobileBottomNavBar({super.key});

  @override
  State<MobileBottomNavBar> createState() => _MobileBottomNavBarState();
}

class _MobileBottomNavBarState extends State<MobileBottomNavBar> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (_selectedIndex) {
      case 0:
        Navigator.pushNamed(context, '/avatar');
        break;
      case 1:
        Navigator.pushNamed(context, '/studentLanding');
        break;
      case 3:
        Navigator.pushNamed(context, '/questBoard');
        break;
      default:
        Navigator.pushNamed(context, '/');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Avatar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.flag),
          label: 'Quests',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blueGrey,
      unselectedLabelStyle: const TextStyle(color: Colors.blueGrey),
      selectedLabelStyle: const TextStyle(color: Colors.red),
      onTap: _onItemTapped,
    );
  }
}
