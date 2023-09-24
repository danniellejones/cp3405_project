import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/class_view_widget.dart';
import 'package:flutter/material.dart';

class ClassViewScreen extends StatelessWidget {
  const ClassViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Class View',
      content: [
        ClassViewWidget(),
      ],
    );
  }
}
