import 'package:cp3405_project/models/student.dart';
import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  final Student? student;
  const AvatarWidget({super.key, required this.student});

  String getName() {
    return student?.getName() ?? '<username>';
  }

  Widget getImage() {
    //student?.getImage() todo in student class
    return const Placeholder();
  }

  int getLevel() {
    int points = (student?.getPoints() ?? 1000);
    if (points < 1000) return 1;
    return points ~/ 1000;
  }

  List<Reward> getRewards() {
    //student?.getRewardsEarned() todo in student class
    return [
      Reward(icon: Icons.star, color: Colors.red),
      Reward(icon: Icons.cake, color: Colors.green),
      Reward(icon: Icons.house, color: Colors.blue),
      Reward(icon: Icons.car_crash, color: Colors.orange),
      Reward(icon: Icons.shield, color: Colors.grey),
      Reward(icon: Icons.gamepad, color: Colors.purple),
      Reward(icon: Icons.tiktok, color: Colors.brown),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // username
          Text(
            getName(),
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          // level
          Text(
            'Level: ${getLevel()}',
            style: const TextStyle(fontSize: 42),
          ),
          // profile image placeholder
          Container(
            margin: const EdgeInsets.all(16.0),
            width: 300,
            height: 300,
            child: getImage(),
          ),
          // mastery and edit buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    // mastery
                    Navigator.pushNamed(context, '/mastery');
                  },
                  icon: const Icon(Icons.king_bed), //generic icon
                  label: const Text(
                    'Mastery',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    side: const BorderSide(color: Colors.black),
                  )),
              ElevatedButton.icon(
                onPressed: () {
                  // edit
                  //Navigator.pushNamed(context, '/avatar_editor');
                },
                icon: const Icon(Icons.draw),
                label: const Text(
                  'Edit Avatar',
                  style: TextStyle(color: Colors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                ),
              ),
            ],
          ),
          const Divider(),
          const Text(
            'Rewards:',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 24),
          ),
          // rewerd display
          GridView.count(
            shrinkWrap: true,
            crossAxisCount: 5,
            children: getRewards().map((reward) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: reward.color.withOpacity(0.5),
                  border: Border.all(
                    color: reward.color,
                    width: 7.0,
                  ),
                ),
                child: IconButton(
                  onPressed: () {
                    //todo
                  },
                  iconSize: 42,
                  icon: Icon(
                    reward.icon,
                    color: reward.color,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

//generic record pattern class to be replaced with actual data class
class Reward {
  final IconData icon;
  final Color color;

  Reward({required this.icon, required this.color});
}
