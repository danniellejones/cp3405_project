import 'package:flutter/material.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CommonAppBar({super.key});

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Title for Screen'),
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
        ]);
  }
}
