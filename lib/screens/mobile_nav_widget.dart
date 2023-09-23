import 'package:cp3405_project/widgets/app_bar.dart';
import 'package:cp3405_project/widgets/pomodoro_widget.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_bar.dart';

class MobileNavigationWidget extends StatelessWidget {
  final PreferredSizeWidget myAppBar;
  final Widget bottomNavBar;
  final Widget content;

  const MobileNavigationWidget({
    super.key,
    this.myAppBar = const CommonAppBar(),
    this.bottomNavBar = const MobileBottomNavBar(),
    this.content = const PomodoroWidget(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      body: content,
      bottomNavigationBar: bottomNavBar,
    );
  }
}



// import 'package:flutter/material.dart';

// class MobileNavigationWidget extends StatefulWidget {
//   const MobileNavigationWidget({super.key});

//   @override
//   State<MobileNavigationWidget> createState() => _MobileNavigationWidgetState();
// }

// class _MobileNavigationWidgetState extends State<MobileNavigationWidget> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.blue,
//             title: const Text('Mobile Navigation'),
//             actions: [
//               IconButton(
//                   onPressed: () {
//                     debugPrint('Logout pressed!');
//                   },
//                   icon: const Icon(Icons.logout)),
//               IconButton(
//                   onPressed: () {
//                     debugPrint('Settings pressed!');
//                   },
//                   icon: const Icon(Icons.settings))
//             ]),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const <BottomNavigationBarItem>[
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Avatar',
//             ),
//             BottomNavigationBarItem(icon: Icon(Icons.computer), label: 'Board')
//           ],
//           currentIndex: _selectedIndex,
//           selectedItemColor: Colors.amber,
//           onTap: _onItemTapped,
//         ),
//         body: const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Text(
//                 'Content Header',
//                 style: TextStyle(fontSize: 24),
//               ),
//               // Add widgets here...
//             ],
//           ),
//         ));
//   }
// }
