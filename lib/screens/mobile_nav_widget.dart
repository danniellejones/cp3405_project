import 'package:flutter/material.dart';
import 'package:cp3405_project/widgets/nav_app_bar.dart';
import '../widgets/nav_bottom_bar.dart';

class MobileNavigationWidget extends StatelessWidget {
  final List<Widget> content;
  final String title;

  const MobileNavigationWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(title: title),
      body: ListView(
        children: content,
        padding: EdgeInsets.all(5),
      ),
      bottomNavigationBar: const MobileBottomNavBar(),
    );
  }
}
