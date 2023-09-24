import 'package:flutter/material.dart';

// Consider using GridView  builder or ListView builder

class QuestBoardWidget extends StatelessWidget {
  final String questTitle;

  const QuestBoardWidget({
    super.key,
    this.questTitle = 'Quest',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            buildQuest(),
            buildQuest(),
            buildQuest(),
          ],
        ),
      ],
    );
  }

  Widget buildQuest() {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      height: 150,
      width: 110,
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.black,
        width: 2,
      )),
      child: Center(
        child: Column(
          children: [
            const Icon(Icons.person),
            Text(questTitle),
          ],
        ),
      ),
    );
  }
}
