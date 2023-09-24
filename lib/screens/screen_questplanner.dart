import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/quest_planner_widget.dart';
import 'package:flutter/material.dart';

class QuestPlannerScreen extends StatelessWidget {
  const QuestPlannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Quest Planner',
      content: [
        QuestPlannerWidget(),
      ],
    );
  }
}
