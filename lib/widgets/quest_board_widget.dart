import 'package:flutter/material.dart';

// Consider using GridView  builder or ListView builder

class QuestBoardWidget extends StatelessWidget {
  final String questTitle;
  final String questDescription;

  const QuestBoardWidget(
      {super.key,
      this.questTitle = 'Quest Title',
      this.questDescription = 'COLLABORATION'});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      // crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
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
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(5),
        height: 650,
        width: 400,
        decoration: BoxDecoration(
            color: Colors.amber,
            border: Border.all(
              color: Colors.black,
              width: 2,
            )),
        child: Center(
          child: Column(
            children: [
              Text(
                questTitle,
                style: const TextStyle(fontSize: 24),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                height: 200,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                child: const Icon(Icons.groups, size: 200.0),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                height: 320,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                child: Center(
                    child: Text(
                  questDescription,
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                )),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(5),
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    )),
                // child: const Icon(Icons.groups, size: 20.0),
                child: const Center(
                    child: Text(
                  'Accept',
                  style: TextStyle(fontSize: 15),
                )),
              )
            ],
          ),
        ));
  }

  //     @override
  //     Widget build(BuildContext context) {
  //     return GridView.count(
  //       crossAxisCount: 3,
  //       mainAxisSpacing: 2,
  //       crossAxisSpacing: 2,
  //       children: <Widget> [
  //         buildQuest(),
  //         buildQuest(),
  //         buildQuest(),
  //         buildQuest(),
  //       ],
  //     );

  // }

  // class QuestBoard extends StatelessWidget {
  //   final List _posts = [
  //     'post 1',
  //     'post 2',
  //     'post 3',
  //   ];

  // QuestBoard({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       Expanded(child: ListView.builder(
  //         itemCount: _posts.length,
  //         itemBuilder: (context, index) {
  //           return MyPostedQuest(
  //             child: _posts[index],
  //           );
  //         }
  //       ))
  //     ],
  //   );
  // }
}
