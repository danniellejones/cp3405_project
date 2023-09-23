import 'package:cp3405_project/screens/mobile_nav_widget.dart';
import 'package:cp3405_project/screens/web_nav_widget.dart';
import 'package:cp3405_project/widgets/bottom_nav_bar.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

class BaseNavigationWidget extends StatelessWidget {
  const BaseNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      debugPrint("Web Activated");
      return WebNavigationWidget();
    } else {
      debugPrint("Mobile Activated");
      return MobileNavigationWidget();
    }
  }
}
