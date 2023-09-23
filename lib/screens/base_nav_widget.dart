import 'package:cp3405_project/screens/mobile_nav_widget.dart';
import 'package:cp3405_project/screens/web_nav_widget.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class BaseNavigationWidget extends StatelessWidget {
  final List<Widget> content;
  final String title;

  const BaseNavigationWidget(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      debugPrint("Web Activated");
      return WebNavigationWidget(title: title, content: content);
    } else {
      debugPrint("Mobile Activated");
      return MobileNavigationWidget(title: title, content: content);
    }
  }
}
