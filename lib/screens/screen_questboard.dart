import 'package:cp3405_project/navigation/nav_base_widget.dart';
import 'package:cp3405_project/widgets/quest_board_widget.dart';
import 'package:flutter/material.dart';

class QuestBoardScreen extends StatelessWidget {
  const QuestBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseNavigationWidget(
      title: 'Quest Board',
      content: [
        QuestBoardWidget(),
      ],
    );
  }
}
