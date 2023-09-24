import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/mastery_widget.dart';
import 'package:flutter/material.dart';

class MasteryScreen extends StatelessWidget {
  const MasteryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Mastery',
      content: [
        MasteryWidget(),
      ],
    );
  }
}
