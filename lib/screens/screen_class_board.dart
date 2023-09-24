import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/class_board_widget.dart';
import 'package:flutter/material.dart';

class ClassBoardScreen extends StatelessWidget {
  const ClassBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Class Board',
      content: [
        ClassBoardWidget(),
      ],
    );
  }
}
